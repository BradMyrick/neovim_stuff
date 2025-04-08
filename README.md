# 🚀 Kodr's Neovim Configuration

> Modern Neovim setup optimized for Go, Rust, Python, and Solidity development

## ✨ Features

- 🤖 AI-Powered Code Completion with GitHub Copilot 
- 🎨 Modern UI with dashboard and custom theme
- 🔧 Full LSP support with advanced completions
- 🛠️ Enhanced Rust development with Rustaceanvim
- ⚡ Fast startup with lazy-loading
- 🌳 Treesitter-powered syntax highlighting
- 🔍 Fuzzy finding with Telescope
- 🐙 Git integration with Fugitive

---

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

   # Additional tools for plugins
   sudo apt install ripgrep fd-find cmake gcc make
   ```

3. Install Rust tools:
   ```bash
   rustup component add rust-analyzer
   ```

4. Open Neovim and install plugins:
   ```vim
   :PackerSync
   ```

---

## ⌨️ Key Mappings

### 📁 File Management
| Mapping | Description |
|---------|-------------|
| `pv` | Open file explorer |
| `w` | Save buffer |
| `q` | Close buffer |
| `n` | New file |

### 🔍 LSP Navigation
| Mapping | Description |
|---------|-------------|
| `gd` | Go to definition |
| `gr` | Show references |
| `K` | Show documentation |
| `rn` | Rename symbol |
| `f` | Format buffer |

### 🌳 Git Commands
| Mapping | Description |
|---------|-------------|
| `gs` | Git status |
| `gc` | Git commit |
| `gp` | Git pull |
| `gu` | Git push |

### 🪟 Window Navigation
| Mapping | Description |
|---------|-------------|
| `` | Navigate windows |
| `t` | Open terminal |
| `` | Exit terminal mode |

### 🦀 Rust-Specific Key Bindings (Rustaceanvim)
| Mapping       | Description                     |
|---------------|---------------------------------|
| `a`   | Show code actions (grouped)    |
| `K`           | Hover actions (Rust-specific)  |
| `rr`  | Run the current file           |
| `tm`  | View crate graph               |

---

## 🎨 Configuration Highlights

### init.lua
```lua
-- Modern plugin management with Packer
use {
    'mrcjkb/rustaceanvim', -- Enhanced Rust tools
    'glepnir/dashboard-nvim', -- Custom start screen
    'nvim-telescope/telescope.nvim', -- Fuzzy finder
    'neovim/nvim-lspconfig', -- LSP configuration
}

-- Mason setup for language servers (except rust-analyzer)
require('mason-lspconfig').setup({
    ensure_installed = {
        'gopls',      -- Go support
        'lua_ls',     -- Lua
        'pyright'     -- Python
    },
    handlers = {
        function(server_name)
            if server_name == 'rust_analyzer' then return end -- Skip rust-analyzer setup (handled by Rustaceanvim)
            require('lspconfig')[server_name].setup({})
        end,
    }
})
```

### keymappings.lua
```lua
-- Efficient keybindings for modern development
vim.keymap.set('n', 'pv', vim.cmd.Ex)  -- Quick file navigation
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)  -- Go to definition

-- Rust-specific mappings (Rustaceanvim)
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set('n', 'a', function() vim.cmd.RustLsp('codeAction') end, { buffer = bufnr })
vim.keymap.set('n', 'K', function() vim.cmd.RustLsp({'hover', 'actions'}) end, { buffer = bufnr })
```

---

## 🔧 Plugin Configuration

- **Dashboard**: Custom start screen with quick actions.
- **LSP**: Configured for Go, Python, Lua, and Rust.
- **Rustaceanvim**: Enhanced Rust development tools, including debugging and crate graph visualization.
- **Telescope**: Fuzzy finder for files and text.
- **Treesitter**: Advanced syntax highlighting.
- **nvim-cmp**: Intelligent code completion.

---

## 🎯 Language Support

- **Go**: Full LSP support with gopls.
- **Rust**: Enhanced development with Rustaceanvim.
- **Python**: Intelligent completion with pyright.
- **Solidity**: Smart contract development ready.

---

## 🤖 Copilot Integration

- **Requirements**: GitHub Copilot subscription.
- **Setup**: Included in `plugins.lua`.
- **Authentication**: Run `:Copilot auth` to authenticate.

---

## 🤝 Contributing

Feel free to submit issues and enhancement requests! PRs are welcome.

---

## 📝 License

MIT License - feel free to use and modify!

---


    Made with ☕ by Kodr


