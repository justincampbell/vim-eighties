# eighties.vim

> Automatically resizes your windows

![Demo](https://s3.amazonaws.com/justincampbell/vim-eighties.gif)

## Features

* Resizes the width of the current window when switching
* Calculates the minimum width (80 by default) + line numbers/signs/etc
* Won't shrink the current window
* Won't resize side panels (supports NERDTree and vimpanel)

## Installation

### [Vundle](https://github.com/gmarik/vundle)

```viml
Bundle 'justincampbell/vim-eighties'
```

### [Pathogen](https://github.com/tpope/vim-pathogen)

```
cd ~/.vim/bundle
git clone git://github.com/justincampbell/vim-eighties.git
```

## Configuration & Defaults

```viml
let g:eighties_enabled = 1
let g:eighties_minimum_width = 80 
let g:eighties_extra_width = 0 " Increase this if you want some extra room
let g:eighties_compute = 1 " Disable this if you just want the minimum + extra
```
