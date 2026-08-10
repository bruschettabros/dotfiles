---
name: new-project
description: Scaffold a new personal Laravel + Inertia/Vue project from the user's ~/Projects/BoilerPlate template — fresh git history, .env wired up, non-colliding Sail ports, dependencies installed, containers booted. Use when the user wants to start a new personal project, side project, or app idea from scratch.
---

# New Project

Bootstraps a fresh project from `~/Projects/BoilerPlate` (Laravel 12 + Inertia +
Vue 3 + Vite + Tailwind + Sail + Pest/Pint). Don't use `laravel new` or
`composer create-project` — the boilerplate is the user's own opinionated starting
point and already has Fortify, Telescope, Wayfinder, ESLint/Prettier, and the
Makefile below configured.

## 1. Get the essentials

Ask if not given: project name (used for the directory under `~/Projects/` and
`APP_NAME`), and whether to create a GitHub repo for it (`gh repo create`) or leave
it local-only for now.

## 2. Copy the template, don't clone its history

```bash
rsync -a --exclude=.git --exclude=vendor --exclude=node_modules --exclude=.env \
  ~/Projects/BoilerPlate/ ~/Projects/<name>/
cd ~/Projects/<name>
git init
cp .env.example .env
```

A fresh `git init` is deliberate — the new project shouldn't inherit BoilerPlate's
commit history.

## 3. Pick non-colliding ports

The user often has more than one Sail project running at once (work's backend-api,
other personal projects) — `APP_PORT`/`FORWARD_DB_PORT`/`VITE_PORT` default to
80/3306/5173 and will collide. Check what's already bound:

```bash
docker ps --format '{{.Ports}}'
```

Pick free ports and append to `.env`, e.g.:

```
APP_PORT=8080
FORWARD_DB_PORT=3307
VITE_PORT=5174
```

## 4. Bootstrap

The Makefile's `$(app)` variable resolves to `php`/`composer` directly until
`vendor/bin/sail` exists, then switches to routing through Sail automatically — so
run these in order, don't reorder:

```bash
make install        # host composer install + npm install; pulls in laravel/sail
php artisan key:generate
make up              # now vendor/bin/sail exists — sail up -d
make migrate
```

Set `APP_NAME` in `.env` to the project name. Leave `APP_URL` as `http://localhost:<APP_PORT>`
unless the user asks for an OrbStack `*.orb.local` hostname matching their work
convention (`XDEBUG_SERVER=main.backend-api.orb.local` in dotfiles).

## 5. Hand off

Report the project path, the URL to open, and that `make dev` starts Vite (run it
in a separate pane/tab — don't background it silently). Don't run `make dev` for
the user or leave it running unattended; that's an interactive dev-server choice
they should make deliberately.

## Notes

- `make lint` runs Pint + `npm run lint`; mention it exists, don't run it unprompted.
- If the user wants the GitHub repo, `gh repo create <name> --private --source=. --remote=origin`
  after the first commit — confirm private vs public, don't assume.
