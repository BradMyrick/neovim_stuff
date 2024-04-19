# Kodr's Neovim Mappings

## Basic Movement
- `h` - move left
- `j` - move down
- `k` - move up
- `l` - move right
- `w` - move forward by word
- `b` - move backward by word
- `<leader>h` - move to start of line
- `<leader>j` - move to first non-blank character of line
- `<leader>l` - move to end of line
- `gg` - move to first line of file
- `G` - move to last line of file
- `gt` - go to a specific line number
- `%` - move to matching bracket

## Scrolling
- `Ctrl + u` - move up half a page
- `Ctrl + d` - move down half a page
- `Ctrl + b` - move up a full page
- `Ctrl + f` - move down a full page
- `H` - move to top of screen
- `M` - move to middle of screen
- `L` - move to bottom of screen
- `zt` - scroll to make current line the top
- `zz` - scroll to make current line the center
- `zb` - scroll to make current line the bottom

## Editing
- `i` - enter insert mode before cursor
- `a` - enter insert mode after cursor
- `o` - insert new line below and enter insert mode
- `O` - insert new line above and enter insert mode
- `u` - undo last change
- `Ctrl + r` - redo last change
- `.` - repeat last command

## Visual Mode
- `v` - enter visual mode
- `V` - enter visual line mode
- `Ctrl + v` - enter visual block mode
- `<C-c>` - copy selection to clipboard
- `<C-x>` - cut selection to clipboard
- `p` - paste after cursor
- `P` - paste before cursor

## Custom LSP Mappings
- `gd` - go to definition
- `gr` - show references
- `<leader>rn` - rename symbol
- `K` - show hover information
- `<leader>f` - format buffer

## Custom Git Mappings
- `<leader>gs` - git status
- `<leader>gd` - open changed files in git (Gdiffsplit)
- `<leader>gp` - git pull
- `<leader>gu` - git push
- `<leader>gc` - open commit buffer for creating a new commit message

## Custom File Mappings
- `<leader>pv` - open file explorer
- `<leader>w` - save current buffer
- `<leader>q` - close current buffer
- `<leader>n` - open new file

## Custom Command Mappings
- `<leader><leader>a` - select all and copy to clipboard

## Window Navigation
- `<C-h>` - move to left window
- `<C-j>` - move to below window
- `<C-k>` - move to above window
- `<C-l>` - move to right window

## System Clipboard Integration
- `<C-c>` - copy selection to clipboard (visual mode)
- `<C-x>` - cut selection to clipboard (visual mode)
- `<C-v>` - paste from clipboard (insert and normal mode)

## Telescope Mappings
- `<leader>ff` - find files
- `<leader>fg` - live grep
- `<leader>fb` - buffers
- `<leader>fh` - help tags
- `<leader>fs` - grep string

