# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Neovim configuration built with Nixvim, a declarative Neovim configuration system using the Nix package manager. The configuration is structured as a Nix flake and provides a comprehensive development environment.

## Essential Commands

### Development Commands

- `nix run .` - Start Neovim with this configuration
- `nix develop` - Enter development shell with all tools available
- `nix flake check` - Validate configuration and run checks
- `nix fmt` - Format all Nix files using treefmt

### Formatting and Linting

- `nix fmt` - Runs treefmt to format multiple file types:
  - Nix files (nixfmt)
  - Lua files (stylua)
  - Markdown files (mdformat)
  - YAML files (yamlfmt)
  - JSON files (jsonfmt)
  - Shell scripts (shfmt, shellcheck)
  - Removes dead code (deadnix, statix)

### Testing and Validation

- `nix flake check .` - Comprehensive validation including configuration checks
- CI runs automatically on pushes to main and pull requests

## Architecture

### Core Structure

- `flake.nix` - Main flake configuration with build system and dependencies
- `config/default.nix` - Main configuration entry point that imports all modules
- `config/` - Nixvim configuration modules organized by functionality

### Configuration Organization

#### Main Configuration Files

- `settings.nix` - Core Neovim options and global settings
- `keymaps.nix` - Custom key bindings
- `autocmds.nix` - Auto-commands and event handlers
- `usercmds.nix` - Custom user commands
- `colorscheme.nix` - Theme and appearance settings
- `ftplugin.nix` - Filetype-specific configurations

#### Plugin System

- `plugins/default.nix` - Main plugin imports
- `plugins/languages/` - Language-specific configurations:
  - TypeScript, Rust, Go, Lua, Nix, Markdown, YAML, JSON, etc.
  - Each language has its own file with LSP, formatters, and tools
- Individual plugin files for major components:
  - `lsp.nix` - Language Server Protocol configuration
  - `treesitter.nix` - Syntax highlighting and parsing
  - `blink.nix` - Completion engine
  - `conform.nix` - Code formatting
  - `lint.nix` - Linting configuration
  - `snacks/` - Snacks.nvim plugin suite (picker, notifier, lazygit, etc.)

### Key Features

- Comprehensive LSP setup with language-specific configurations
- Integrated terminal and git workflows (lazygit)
- File navigation with oil.nvim
- Advanced completion with blink.cmp
- Treesitter-based syntax highlighting
- Built-in formatting and linting for multiple languages
- Tmux navigation integration

### Development Patterns

#### Adding New Plugins

1. Create new `.nix` file in appropriate `plugins/` subdirectory
1. Add import to relevant `default.nix` file
1. Follow existing patterns for plugin configuration structure

#### Language Support

- Language-specific configurations go in `plugins/languages/`
- Each language file typically configures: LSP servers, formatters, linters, treesitter parsers
- Import new language files in `plugins/languages/default.nix`

#### Key Binding Conventions

- Leader key is set to space (" ")
- Diagnostic keybinds use `<leader>d` prefix
- Git operations typically use `<leader>g` prefix
- File operations use `<leader>f` prefix

### Nixvim-Specific Patterns

- Use `enable = true` to activate plugins
- Plugin options go under the plugin's configuration attribute
- LSP servers are configured in the `lsp.servers.<server>` structure
- Keymaps use the `keymaps` attribute with mode, key, and action specifications
