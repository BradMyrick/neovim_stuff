# Kodr's Neovim Cheat Sheet

## Custom Key Mappings

### File and Buffer Management
- `<leader>pv`: Open file explorer (vim.cmd.Ex)
- `<leader>w`: Save current buffer
- `<leader>q`: Close current buffer
- `<leader>n`: Open new file

### LSP (Language Server Protocol)
- `gd`: Go to definition
- `gr`: Show references
- `<leader>rn`: Rename symbol
- `K`: Show hover information
- `<leader>f`: Format buffer

### Git Integration
- `<leader>gs`: Git status
- `<leader>gd`: Open changed files in Git (Gdiffsplit)
- `<leader>gp`: Git pull
- `<leader>gu`: Git push
- `<leader>gc`: Git commit

### Window Navigation
- `<C-h>`: Navigate to the left window
- `<C-j>`: Navigate to the bottom window
- `<C-k>`: Navigate to the top window
- `<C-l>`: Navigate to the right window

### Custom Copy and Paste
- `<C-c>` (Visual mode): Copy selected text
- `<C-x>` (Visual mode): Cut selected text
- `<C-v>` (Insert and Normal mode): Paste text
- `<leader><leader>a`: Copy the entire buffer

### Line Navigation
- `<leader>h`: Move to the start of the line
- `<leader>l`: Move to the end of the line
- `<leader>j`: Move to the first non-blank character of the line

### Terminal
- `<leader>t`: Open terminal from Normal mode
- `<Esc>` (Terminal mode): Close terminal and return to Normal mode

### Miscellaneous
- `<leader><leader><leader>`: Jump back to the previous file

## Normal Movements (Unmodified)
- `h`: Move left
- `j`: Move down
- `k`: Move up
- `l`: Move right
- `0`: Move to the start of the line
- `$`: Move to the end of the line
- `w`: Move to the start of the next word
- `b`: Move to the start of the previous word
- `e`: Move to the end of the current word
- `gg`: Move to the first line of the file
- `G`: Move to the last line of the file
- `zz`: Center the current line on the screen
- `zt`: Scroll the current line to the top of the screen
- `zb`: Scroll the current line to the bottom of the screen

Note: The `<leader>` key is set to the space character in my configuration.
