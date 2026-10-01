-- PHP / Laravel on top of the lazyvim lang.php extra.
--   LSP:     intelephense does hover/completion/definition/diagnostics; phpactor runs alongside
--            only for code actions (<leader>ca) and rename, since intelephense's free tier has neither.
--   Format:  Laravel Pint (not php-cs-fixer), manual only (<leader>cf): projects run `pint --dirty`
--            and many files aren't Pint-clean, so format-on-save would rewrite whole files.
--   Lint:    phpcs off; with no project ruleset it just flags PSR-12 noise.
--   Tests:   <leader>P* run artisan/phpunit, inside the app container when the Makefile sets
--            COMPOSE_FILE (service "main", override with vim.g.php_docker_service).

local last_cmd

local function root()
  return LazyVim.root.get({ normalize = true })
end

-- Prefix that runs a command in the project's app container, or {} to run locally
local function exec_prefix(dir)
  local makefile = dir .. "/Makefile"
  if vim.uv.fs_stat(makefile) then
    for line in io.lines(makefile) do
      local compose_file = line:match("^COMPOSE_FILE%s*:?=%s*(%S+)")
      if compose_file then
        return { "docker", "compose", "-f", compose_file, "exec", vim.g.php_docker_service or "main" }
      end
    end
  end
  return {}
end

local function run(args, opts)
  opts = opts or {}
  local dir = root()
  local cmd = vim.list_extend(exec_prefix(dir), args)
  if not opts.interactive then
    last_cmd = cmd
  end
  Snacks.terminal(cmd, {
    cwd = dir,
    interactive = opts.interactive or false,
    auto_close = opts.interactive or false,
    win = { position = "bottom", height = 0.35 },
  })
end

local function test_cmd(dir)
  return vim.uv.fs_stat(dir .. "/artisan") and { "php", "artisan", "test" } or { "vendor/bin/phpunit" }
end

local function test(scope)
  local dir = root()
  local args = test_cmd(dir)
  local file = vim.fn.expand("%:p"):sub(#dir + 2)
  if scope ~= "all" then
    table.insert(args, file)
  end
  if scope == "nearest" then
    local lnum = vim.fn.search([[\vfunction\s+\w+\s*\(]], "bcnW")
    local name = lnum > 0 and vim.fn.getline(lnum):match("function%s+([%w_]+)")
    if not name then
      return vim.notify("No test method above the cursor", vim.log.levels.WARN)
    end
    table.insert(args, "--filter=" .. name)
  end
  run(args)
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = {
          enabled = true,
          init_options = {
            -- its reflection diagnostics misfire on Laravel magic (Model::select(), macros)
            ["language_server_worse_reflection.diagnostics.enable"] = false,
          },
          handlers = {
            ["textDocument/publishDiagnostics"] = function() end,
          },
          on_attach = function(client)
            -- leave everything except code actions/rename/implementation to intelephense
            local caps = client.server_capabilities
            for _, cap in ipairs({
              "hoverProvider",
              "completionProvider",
              "definitionProvider",
              "referencesProvider",
              "documentSymbolProvider",
              "workspaceSymbolProvider",
              "signatureHelpProvider",
              "documentHighlightProvider",
              "documentFormattingProvider",
              "documentRangeFormattingProvider",
              "semanticTokensProvider",
            }) do
              caps[cap] = nil
            end
            -- drop its 'Fix "Method x does not exist"' actions: with Laravel magic they're
            -- almost all false positives, and it returns them for the whole file
            local request = client.request
            client.request = function(self, method, params, handler, ...)
              if method == "textDocument/codeAction" and handler then
                local orig = handler
                handler = function(err, result, ...)
                  if type(result) == "table" then
                    result = vim.tbl_filter(function(action)
                      return not (action.title or ""):match('^Fix ".*does not exist"$')
                    end, result)
                  end
                  return orig(err, result, ...)
                end
              end
              return request(self, method, params, handler, ...)
            end
          end,
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.php = { "pint" }
    end,
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "php", "blade" },
        callback = function(ev)
          vim.b[ev.buf].autoformat = false
        end,
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.php = {}
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "php", "php_only", "phpdoc", "blade" } },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      -- Xdebug 3 in a container with the project mounted at /var/www.
      -- Needs xdebug in the image with xdebug.mode=debug, xdebug.client_host=host.docker.internal
      require("dap").configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug (Docker /var/www)",
          port = 9003,
          pathMappings = { ["/var/www"] = "${workspaceFolder}" },
        },
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug (local)",
          port = 9003,
        },
      }
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = { spec = { { "<leader>P", group = "PHP/Laravel", icon = { icon = " ", color = "purple" } } } },
  },
  {
    "LazyVim/LazyVim",
    keys = {
      { "<leader>Pt", function() test("nearest") end, ft = { "php", "blade" }, desc = "Test nearest" },
      { "<leader>Pf", function() test("file") end, ft = { "php", "blade" }, desc = "Test file" },
      { "<leader>PA", function() test("all") end, ft = { "php", "blade" }, desc = "Test all" },
      {
        "<leader>Pl",
        function()
          if not last_cmd then
            return vim.notify("No previous PHP command", vim.log.levels.WARN)
          end
          Snacks.terminal(last_cmd, { cwd = root(), interactive = false, win = { position = "bottom", height = 0.35 } })
        end,
        ft = { "php", "blade" },
        desc = "Re-run last",
      },
      {
        "<leader>Pa",
        function()
          vim.ui.input({ prompt = "php artisan " }, function(input)
            if input and input ~= "" then
              run(vim.list_extend({ "php", "artisan" }, vim.split(input, "%s+", { trimempty = true })))
            end
          end)
        end,
        ft = { "php", "blade" },
        desc = "Artisan command",
      },
      { "<leader>Pr", function() run({ "php", "artisan", "route:list", "--except-vendor" }) end, ft = { "php", "blade" }, desc = "Route list" },
      { "<leader>Pk", function() run({ "php", "artisan", "tinker" }, { interactive = true }) end, ft = { "php", "blade" }, desc = "Tinker" },
      { "<leader>Pp", function() run({ "vendor/bin/pint", "--dirty" }) end, ft = { "php", "blade" }, desc = "Pint changed files" },
    },
  },
}
