# 🚀 Kodr's Neovim Configuration

> Modern Neovim setup optimized for Go, Rust, Python, and Solidity development

## ✨ Features

- 🤖 AI-Powered Code Completion with GitHub Copilot 
- 🎨 Modern UI with dashboard and custom theme
- 🔧 Full LSP support with advanced completions
- ⚡ Fast startup with lazy-loading
- 🛠️ Integrated development environment for multiple languages
- 🌳 Treesitter-powered syntax highlighting
- 🔍 Fuzzy finding with Telescope
- 🐙 Git integration with fugitive

## 🎯 Quick Start

1. Clone this repository:
```bash
git clone https://github.com/BradMyrick/nvim-config.git ~/.config/nvim
```

2. Install required dependencies:
```bash
# Neovim 0.10.0 or higher required
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim
```

## ⌨️ Key Mappings

### 📁 File Management
| Mapping | Description |
|---------|-------------|
| `<Space>pv` | Open file explorer |
| `<Space>w` | Save buffer |
| `<Space>q` | Close buffer |
| `<Space>n` | New file |

### 🔍 LSP Navigation
| Mapping | Description |
|---------|-------------|
| `gd` | Go to definition |
| `gr` | Show references |
| `K` | Show documentation |
| `<Space>rn` | Rename symbol |
| `<Space>f` | Format buffer |

### 🌳 Git Commands
| Mapping | Description |
|---------|-------------|
| `<Space>gs` | Git status |
| `<Space>gc` | Git commit |
| `<Space>gp` | Git pull |
| `<Space>gu` | Git push |

### 🪟 Window Navigation
| Mapping | Description |
|---------|-------------|
| `<C-h/j/k/l>` | Navigate windows |
| `<Space>t` | Open terminal |
| `<Esc>` | Exit terminal mode |

## 🎨 Configuration Highlights

### init.lua
```lua
-- Modern plugin management with Packer
use {
    'glepnir/dashboard-nvim',  -- Custom start screen
    'nvim-telescope/telescope.nvim',  -- Fuzzy finder
    'neovim/nvim-lspconfig',  -- LSP configuration
    'hrsh7th/nvim-cmp',  -- Completion engine
}

-- LSP setup for multiple languages
require('mason-lspconfig').setup({
    ensure_installed = {
        'gopls',      -- Go support
        'lua_ls',     -- Lua
        'solidity',   -- Solidity
        'pyright'     -- Python
    }
})
```

### keymappings.lua
```lua
-- Efficient keybindings for modern development
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)  -- Quick file navigation
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)  -- Go to definition
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)  -- Git integration
```

## 🔧 Plugin Configuration

- **Dashboard**: Custom start screen with quick actions
- **LSP**: Configured for Go, Rust, Python, and Solidity
- **Telescope**: Fuzzy finder for files and text
- **Treesitter**: Advanced syntax highlighting
- **nvim-cmp**: Intelligent code completion

## 🎯 Language Support

- **Go**: Full LSP support with gopls
- **Rust**: Enhanced development with rustaceanvim
- **Python**: Intelligent completion with pyright
- **Solidity**: Smart contract development ready

## 🤖 Copilot Integration

- **Requirements**: GitHub Copilot subscription
- **Setup**: Included in init.lua
- **Authentication**: Run `:Copilot auth` to authenticate

## 🤝 Contributing

Feel free to submit issues and enhancement requests! PRs are welcome.

## 📝 License

MIT License - feel free to use and modify!

---
<div align="center">
    <p>Made with ☕ by <a href="https://github.com/BradMyrick">Kodr</a></p>
    <p>Systems Engineer</p>
</div>
