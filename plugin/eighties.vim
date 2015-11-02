" eighties.vim - Automatically resizes your windows
" Author: Justin Campbell <http://justincampbell.me>
" Version: 1.0.7

if exists('g:loaded_eighties') || &cp || v:version < 700
  finish
endif
let g:loaded_eighties = 1

command! EightiesResize call eighties#EightiesResize()

autocmd WinEnter,BufEnter,BufWinEnter,BufWritePost * EightiesResize
