# Neo-IDE

A full minimalist neovim config ready to replace your IDE

![Neovim](https://img.shields.io/badge/Editor-Neovim-57A143?logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/Config-Lua-2C2D72?logo=lua&logoColor=white)
![Platform](https://img.shields.io/badge/Platforms-macOS%20%7C%20Linux%20%7C%20Windows-555?logo=github)
![License](https://img.shields.io/badge/License-Personal%20use-lightgrey)

My personal Neovim setup, written in Lua and managed with [lazy.nvim](https://github.com/folke/lazy.nvim). It includes LSP support, completion, Tree-sitter highlighting, Telescope, a file explorer, debugging, and a collection of editing conveniences. Plugin versions are recorded in [`lazy-lock.json`](lazy-lock.json).

## Requirements

- [Neovim](https://neovim.io/) 0.12 or later (the `main` branch of nvim-treesitter requires 0.12+).
- Git, `curl`, `tar`, and `unzip` for plugin and tool downloads.
- Node.js and npm for JavaScript-based language servers, including Tailwind CSS and TypeScript.
- Python 3 for Python language tooling.
- A C/C++ compiler for compiling Tree-sitter parsers.
- The `tree-sitter` CLI (0.26.1 or later) for the current nvim-treesitter setup.
- A nerd font (config uses jetbrains mono nerd font in vim-options.lua)

## Install prerequisites

### macOS

Install Apple's Command Line Tools to get `clang`, Apple's C/C++ compiler:

```sh
xcode-select --install
```

Install [Homebrew](https://github.com/Homebrew/brew) separately by following its installation instructions. Then install the remaining tools and fonts:

```sh
brew install neovim node python tree-sitter-cli
brew install --cask font-jetbrains-mono-nerd-font
```

Node.js includes npm. Check the installations with `nvim --version`, `node --version`, `npm --version`, `python3 --version`, `clang --version`, and `tree-sitter --version`.

### Linux

Use your distribution's package manager. For Debian or Ubuntu:

```sh
sudo apt update
sudo apt install neovim git curl tar unzip build-essential nodejs npm python3 python3-pip
```

For Arch Linux:

```sh
sudo pacman -S neovim git curl tar unzip base-devel nodejs npm python tree-sitter-cli ttf-jetbrains-mono-nerd --needed
```

For Fedora:

```sh
sudo dnf install neovim git curl tar unzip gcc-c++ nodejs npm python3
```

Install `tree-sitter-cli` from your distribution if available; otherwise use the [Tree-sitter CLI installation instructions](https://tree-sitter.github.io/tree-sitter/cli/installation.html). Distribution Neovim packages can lag behind current releases, so check `nvim --version` if the LSP or Tree-sitter configuration reports unsupported APIs.

### Windows

Install Neovim, Node.js (which includes npm), and Python 3. For example, from PowerShell with WinGet:

```powershell
winget install Neovim.Neovim
winget install OpenJS.NodeJS.LTS
winget install Python.Python.3.13
```

Install the [Visual Studio C++ Build Tools](https://learn.microsoft.com/en-us/cpp/overview/acquire-msvc) and select the **Desktop development with C++** workload. Install Rust with [rustup](https://rustup.rs/) if you need to build the Tree-sitter CLI from source, then run:

```powershell
cargo install --locked tree-sitter-cli
```

## Make `python` run Python 3

On macOS and Linux, Python 3 is commonly available as `python3`. Add the matching setup for your shell.

### Bash or Zsh

Add this line to `~/.bashrc` (Bash) or `~/.zshrc` (Zsh):

```sh
alias python=python3
```

Reload the file, for example `source ~/.zshrc`.

### Fish

Run this once; `--save` persists the alias in Fish's configuration:

```fish
alias --save python python3
```

### PowerShell

Add this function to the PowerShell profile, which you can open with `notepad $PROFILE`:

```powershell
function python { py -3 @args }
```

Create the profile file first if PowerShell says it does not exist:

```powershell
New-Item -ItemType File -Path $PROFILE -Force
```

Restart PowerShell afterward. This uses the Python launcher to select Python 3.

### Command Prompt (cmd.exe)

For the current Command Prompt window, run:

```cmd
doskey python=py -3 $*
```

`doskey` macros last only for that window. For persistent use, prefer PowerShell or a Bash/Zsh/Fish shell.

## Install Neovim plugins and language servers

Clone this repository into your Neovim configuration directory, then start Neovim. lazy.nvim will bootstrap and install the plugins. Mason installs the configured language servers; if an installation fails, open `:MasonLog` to see the package-specific error.

Tree-sitter parsers are installed by the configuration. If needed, update them inside Neovim with `:TSUpdate`.

## Configuration layout

- `init.lua` loads the active configuration.
- `lua/config/` contains core options, keymaps, plugin-manager setup, and Tree-sitter behavior.
- `lua/plugins/` contains plugin specifications.
- `lazy-lock.json` pins plugin revisions.
- `nvim-config-old/` is a retained legacy configuration and is not active.
