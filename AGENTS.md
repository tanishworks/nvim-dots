# Repository Guidelines

## Project Structure & Module Organization

This repository is a personal Neovim configuration. `init.lua` sets core editor options and loads modules from `lua/config/`. Keep editor setup such as keymaps, colorscheme selection, plugin manager bootstrapping, and Tree-sitter behavior in that directory. Plugin specifications belong in `lua/plugins/`; Lazy.nvim imports them automatically. `lazy-lock.json` records pinned plugin revisions. `nvim-config-old/` is a retained legacy configuration and should not be treated as the active configuration unless a task specifically targets it.

## Build, Test, and Development Commands

There is no separate build or test framework. From this directory:

- `nvim` starts Neovim with this configuration and is the primary smoke check.
- `nvim --headless '+qall'` checks that startup completes without an interactive session; plugin installation or network availability may affect first startup.
- In Neovim, `:Lazy sync` installs or updates plugins after changing plugin specs. Review changes to `lazy-lock.json` with the related spec change.

## Coding Style & Naming Conventions

Write Lua modules under `lua/` and load them with `require("config.name")` or `require("plugins.name")`. Use four spaces for indentation, matching the top-level editor settings. Name module files in lowercase, using descriptive nouns such as `keymaps.lua` or `treesitter.lua`. Prefer small, focused modules and preserve existing plugin-spec table structure. The `.luarc.json` file configures Lua diagnostics to recognize Neovim's global `vim`.

## Testing Guidelines

No automated test suite or coverage requirement is configured. For configuration changes, start Neovim and confirm there are no startup errors. For plugin changes, run `:Lazy sync`, then verify the affected plugin behavior (for example, `<leader>ff` for Telescope file search). Keep manual checks focused on the module changed.

## Commit & Pull Request Guidelines

Git history is unavailable in this checkout, so no repository-specific commit convention can be confirmed. Use concise imperative commit subjects (for example, `Add Telescope live grep mapping`). Pull requests should explain the user-visible configuration change, list any manual validation performed, and mention plugin or lockfile updates. Include screenshots only when a visual change is relevant.

## Security & Configuration Tips

Do not commit credentials, machine-specific secrets, or generated plugin files. Keep plugin versions reproducible through `lazy-lock.json`, and avoid changing the legacy directory when the active configuration is the target.
