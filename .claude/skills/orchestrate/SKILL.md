---
name: orchestrate
description: Drive an autonomous multi-agent work session inside Herdr — break a backlog of work (tickets, a spec, an ad-hoc task list) into isolated units, provision a git worktree per unit, spawn a Claude agent in each, prompt and monitor them to completion, and report results. Use when the user asks to "orchestrate", "drive agents", "work through the backlog", or wants a Herdr central tab to autonomously fan out work across worktrees.
---

# Orchestrate

Fan work out across Herdr worktrees and driven agent panes, from a central tab. This
session is the driver: it never writes the actual code itself for parceled-out work —
it provisions, prompts, watches, and reports.

## 0. Preconditions

- `test "${HERDR_ENV:-}" = 1` — if unset, say you're not in a Herdr pane and stop.
- Read `herdr --skill` once at the start of a run for the current CLI's exact syntax,
  ID handling, and state semantics (`idle`/`working`/`blocked`/`done`/`unknown`) — it
  is the authority, not this file. Everything below assumes you've read it.

## 1. Work out the backlog

The user's invocation names or implies the work source — a ticket tracker
(`gh issue list`, Linear, Jira), a markdown backlog/spec file, a failing-CI list, or
just a prose task list in the prompt. Resolve it with whatever tool fits (`gh`, `Read`,
`WebFetch`) — don't assume a tracker that isn't there.

Turn it into a list of **independent, worktree-sized units**: each one buildable and
testable in isolation, on its own branch, without depending on another unit's
uncommitted changes. Flag units that are too entangled to isolate — ask the user
rather than guessing.

If the user gave a single big task rather than a backlog, that's fine — orchestration
can still be worth it if it splits cleanly into isolated units (e.g. a spec with
independent open questions/sections); otherwise just do the work directly instead of
standing up the machinery.

## 2. Provision one worktree + agent per unit

Per unit:

```bash
herdr worktree create --branch <branch-name> --base <base-ref> --label "<short label>" --no-focus
```

Read the new pane/tab id from the JSON result. Start Claude there:

```bash
herdr agent start <short-unique-name> --kind claude --pane <pane-id>
```

Write a **self-contained prompt** — the spawned agent has none of this conversation's
context. Include the specific unit of work, acceptance criteria, relevant file paths,
and how to report back (e.g. "when done, summarize what changed and any open
questions in your final message"). Then:

```bash
herdr agent prompt <name> "<prompt>" --wait --timeout <ms>
```

Cap concurrency (default 3 simultaneous agents unless the user asks for more) —
provision the next unit only once a running one frees up, to keep panes reviewable
and avoid resource contention.

## 3. Drive each agent to done

`--wait` returns on the first settled state. Loop:

- **idle/done**: read its output
  (`herdr agent read <name> --source recent-unwrapped --lines 200`). If the unit's
  acceptance criteria are met, mark it done and move to the next unit. If not, send a
  follow-up prompt.
- **blocked**: it's asking a question or wants approval. Read its output, answer
  directly if the answer is unambiguous and within scope; otherwise surface the
  question to the user before unblocking it with another `agent prompt`.
- **unknown**: inspect with `agent get` / `agent explain`; don't assume completion.

Poll with `herdr agent wait <name> --timeout <ms>` rather than busy-looping.

## 4. Report, don't merge

When a unit finishes, summarize what the agent did (diff scope, tests run, open
questions) back to the user. Do not push, merge, or open PRs from spawned worktrees
without the user's explicit go-ahead — leave finished branches for review, matching
this session's own confirm-before-shared-state rule.

## Safety

Inherit Herdr's own rules verbatim: `--no-focus` for background provisioning, never
target another client's focused pane, never close panes/tabs/workspaces you didn't
create, never `herdr server stop`. Parse every ID from JSON responses, never guess
them.
