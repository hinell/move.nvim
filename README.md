# move.nvim

> Commands for moving line-wise and block-wise lines and characters, both vertically and horizontally.

# Demo
https://user-images.githubusercontent.com/8136158/212197108-33442adb-2107-4d75-a0a3-bd0af7bcbc83.mp4

https://user-images.githubusercontent.com/8136158/212197110-f817a514-93d5-4118-919b-6c96f129ab54.mp4

https://user-images.githubusercontent.com/8136158/212197112-b352d25d-63f3-4a4d-893a-3efe52a81052.mp4

![word](https://user-images.githubusercontent.com/26419570/227013070-6c5e041c-c500-4944-8c83-79d5d54f6394.gif)


## Requirements

This plugin works with NeoVim v0.5 or later.

## Installation
#### [packer.nvim](https://github.com/wbthomason/packer.nvim)
``` lua
use "hinell/move.nvim"
```

#### [vim-plug](https://github.com/junegunn/vim-plug)

``` vim
Plug "hinell/move.nvim"
```

#### [paq](https://github.com/savq/paq-nvim)

``` lua
"hinell/move.nvim";
```
#### [lazy](https://github.com/folke/lazy.nvim)


```lua
"hinell/move.nvim"
```

## Usage

The plugin provides the following commands. Every command accept `[0-9]+` number:

| Command    | Description | Modes |
|------------|-------------|------|
| MoveLine   | Moves a line up or down | Normal |
| MoveBlock  | Moves a selected block of text, up or down | Visual |
| MoveWord   | Moves the word under the cursor forwards or backwards | Normal |
| MoveHChar  | Moves the character under the cursor, left or right | Normal |
| MoveHBlock | Moves a visual area, left or right | Visual |

## Setup

NO keybindings are setup by default. </br>

#### Lua

Alternatively, you can setup <kbd>ALT+...</kbd> hotkeys manually:

``` lua
local opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set('n', '<A-Up>'      ,':MoveLine 1<CR>', opts)
vim.keymap.set('n', '<A-Down>'    ,':MoveLine -1<CR>', opts)
vim.keymap.set('n', '<A-S-Left>'  ,':MoveWord -1<CR>', opts)
vim.keymap.set('n', '<A-S-Right>' ,':MoveWord 1<CR>', opts)

-- Visual-mode commands
vim.keymap.set('x', '<A-Up>'   , ':MoveBlock 1<CR>', opts)
vim.keymap.set('x', '<A-Down>' , ':MoveBlock -1<CR>', opts)
vim.keymap.set('v', '<A-Left>' , ':MoveHBlock -1<CR>', opts)
vim.keymap.set('v', '<A-Right>', ':MoveHBlock 1<CR>', opts)

...

```

#### VimScript

Not recommended.

``` vim-script
" Normal-mode commands
nnoremap <silent> <A-j> :MoveLine 1<CR>
nnoremap <silent> <A-k> :MoveLine -1<CR>
nnoremap <silent> <A-l> :MoveHChar 1<CR>
nnoremap <silent> <A-h> :MoveHChar -1<CR>

" Visual-selection-mode commands
xnoremap <silent> <A-j> :MoveBlock 1<CR>
xnoremap <silent> <A-k> :MoveBlock -1<CR>
vnoremap <silent> <A-l> :MoveHBlock 1<CR>
vnoremap <silent> <A-h> :MoveHBlock -1<CR>
```

## Thanks

There is an original and more feature rich plugin (written in VimScript):

[vim-move](https://github.com/matze/vim-move).

**Original author**: thanks to `fedepujol@github.com`. Most of the code can be is attributed to him.
I made a few impromements over `fedepujol`'s work: added `plugin/init.lua` for better compatibility and updated media.


## See also
* [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)

----
> September 15, 2023
