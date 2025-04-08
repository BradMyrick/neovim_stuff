# 🛠️ Development Environment Setup Guide

From clean system to fully configured Zsh + Neovim dev environment

## Prerequisites
- Ubuntu/Debian-based system (tested on Ubuntu 22.04+)
- `sudo` privileges
- Internet connection

---

## 1. System Packages Installation

### Base Development Tools
```Bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y \
  git curl wget make gcc build-essential \
  python3-pip python3-venv \
  xclip ripgrep fd-find unzip  # Clipboard and file tools
```

### Language Runtimes
```Bash
# Node.js (for npm and Copilot)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# Go
wget https://go.dev/dl/go1.21.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.21.4.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# Neovim
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update && sudo apt install neovim -y
```

---

## 2. Zsh Configuration

### Install Zsh and Plugins
```Bash
sudo apt install zsh -y
chsh -s $(which zsh)  # Set as default shell

# Clone plugins
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search
```

### Set Up .zshrc
```Bash
# Back up existing config
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak

# Use provided config
ln -s ~/neovim_stuff/.zshrc ~/.zshrc
source ~/.zshrc
```

---

## 3. Neovim Setup

### Clone Configuration
```Bash
mkdir -p ~/.config
ln -s ~/neovim_stuff ~/.config/nvim
```

### Install Packer.nvim (Plugin Manager)
```Bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### First-Time Setup
```Bash
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

---

## 4. Post-Install Verification

### Zsh Checks
```Bash
# Should show zsh 5.8 or newer
zsh --version

# Test plugins
echo "Type 'git ' and check for autosuggestions"
```

### Neovim Checks
```Bash
nvim +checkhealth
nvim +"LspInfo"  # Verify LSP installations
```

---

## Repository Structure
```Bash
neovim_stuff/
├── .zshrc                 # Zsh configuration
└── .config/nvim/
    ├── init.lua           # Main config
    ├── lua/               # Modular config
    │   ├── core/          # Base settings
    │   └── plugins/       # Plugin configs
    └── plugin/            # Packer compiled
```

---

## .zshrc Features
- History-based autosuggestions
- Syntax highlighting
- Custom prompt
- Aliases for common dev tasks
- Path management for Go/Rust

---

