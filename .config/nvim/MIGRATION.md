# PhpStorm / Rider → Neovim

Where each `.ideavimrc` binding lives now. **Same** = ported as-is (see `lua/config/keymaps.lua`);
otherwise it collided with a LazyVim default, so use the LazyVim key. `<leader>` is still Space.
Press `<leader>` and wait to browse everything, or `<leader>sk` to search keymaps.

## Navigation / search
| JetBrains action | IdeaVim key | Neovim |
|---|---|---|
| Search Everywhere / Go to File | `<leader><leader>` | `<leader><leader>` (files), `<leader>/` (grep) |
| Go to Action | `<leader>ga` | `<leader>sC` (commands), `<leader>:` (command history) |
| Go to Class / Symbol | `<leader>gc` / `<leader>gs` | `<leader>sS` (workspace symbols), `<leader>ss` (file symbols) |
| Recent Files | `<leader>rf` | `<leader>fr` |
| Recent Projects | — | `<leader>fp` |
| Select in Project View | `<leader>ff` | `<leader>e` (explorer, follows current file) |
| File Structure Popup | `<leader>oo` | **same**: sidebar outline (`<leader>cs` too) |
| Show NavBar | `<leader>sn` | sticky scroll at top of window (treesitter-context, `<leader>ut` to toggle) |
| Go to Implementation | `gi` | `gI` |
| Go to Declaration | — | `gd` (definition), `gD` (declaration), `gy` (type definition) |
| Find / Show Usages | `<leader>fu` / `<leader>su` | **`<leader>fu`** or `gr` |
| Method Hierarchy | `<leader>mh` | **same** (shows callers) |
| Next / prev error | `ge`, `ne` / `nE` | `]e` / `[e` (errors), `]d` / `[d` (any diagnostic) |
| Show Error Description | `<leader>se` | `<leader>cd` |
| Method up / down | `[[` / `]]` | `[f` / `]f` (`[[`/`]]` jump between usages of the word) |
| Prev / next editor tab | `gp` / `gn` | **same**, or `H` / `L` |
| Jump (fastTravel) | `<leader><leader>` | `s` + chars (flash) |
| Quick Doc | `<leader>jd` | `K` |

## Editing / refactoring
| JetBrains action | IdeaVim key | Neovim |
|---|---|---|
| Rename Element | `<leader>rn` | **same**, or `<leader>cr` |
| Rename File | `<leader>mf` | **same**, or `<leader>cR` |
| Reformat Code | `<leader>fc` | `<leader>cf` |
| Optimize Imports | `<leader>oi` | **same** (where the LSP supports it) |
| Extract Method (visual) | `<leader>em` | **same**, or `<leader>rf` |
| Extract Variable (visual) | — | `<leader>ev` or `<leader>rx`; all refactors: `<leader>rs` |
| Implement / Override Methods, Generate | `<leader>im` / `<leader>om` / `<leader>pg` | `<leader>im` or `<leader>ca` (code actions) |
| Fix Doc Comment | `<leader>fd` | **same**: generates a docblock (`<leader>cn`) |
| Surround With | `<leader>sw` | `ys{motion}{char}`, visual `S{char}`, `cs`/`ds` |
| Multiple cursors | — | `<C-n>` on a word, `<M-Down>`/`<M-Up>` |
| Paste from history | `<leader>sr` | `<leader>p` (yanky) |
| Select function / class | `<leader>sf` / `<leader>sc` | `vaf` / `vac` (also `daf`, `cif`…) |
| Delete method | `dam` | `daf` |
| Split line | `<CR>` | **same** |
| Redo | `U` | **same** |
| Zen mode | `<leader>tz` | **same**, or `<leader>uz` |

## Git
| JetBrains action | IdeaVim key | Neovim |
|---|---|---|
| VCS popup / commit / push | `<leader>gp` | `<leader>gg` (lazygit) |
| Branches | `<leader>gb` | lazygit, branches panel (`<leader>gb` is blame line now) |
| File History | `<leader>gh` | `<leader>gH` (diffview), `<leader>gf` (picker) |
| Diff / Merge conflicts | — | `<leader>gv` open, `<leader>gV` close |
| Annotate (blame) | `<leader>aa` | always shown inline (git-blame.nvim), `<leader>gB` browse |
| Rollback Changed Lines | `<leader>rl` | **same**, or `<leader>ghr` |
| Run git / make command | `<leader>g-` / `<leader>m-` | **same** |

## Run / debug
| JetBrains action | IdeaVim key | Neovim |
|---|---|---|
| Start listening for Xdebug | `<leader>0` / `<leader>ld` | `<leader>0` or `<leader>dc`, then pick “Listen for Xdebug” |
| Toggle breakpoint | `<leader>tb` | **same**, or `<leader>db` |
| Step over / into, stop | `<leader>so` / `<leader>si` / `<leader>ss` | `<leader>dO` / `<leader>di` / `<leader>dt` |
| Evaluate Expression | `<leader>ee` | `<leader>de` |
| Run tests (PHP) | `<leader>rc` | `<leader>Pt` nearest, `<leader>Pf` file, `<leader>Pl` rerun |
| Run / debug / test (.NET) | Rider | `<leader>Nr`, `<leader>Nd`, `<leader>Nt` |
| Run Anything / artisan | `<leader>ra` | `<leader>Pa` (artisan), `<leader>Pk` (tinker) |
| Terminal | `<leader>ot` | **same**, or `<C-/>` |
| HTTP client (`.http` files) | Tools → HTTP Client | open a `.http` file, `<leader>Rs` to send |
| Database (DataGrip) | — | `<leader>D` (dadbod UI) |

## Windows
`<leader>w` passes keys straight to `<C-w>`, so `<leader>ww`, `<leader>ws`, `<leader>wv` and
`<leader>wd` all work as they did. Move between windows with `<C-h/j/k/l>`.
