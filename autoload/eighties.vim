if !exists('g:eighties_enabled')
  let g:eighties_enabled = 1
endif

if !exists('g:eighties_minimum_width')
  let g:eighties_minimum_width = 80
endif

if !exists('g:eighties_extra_width')
  let g:eighties_extra_width = 0
endif

if !exists('g:eighties_compute')
  let g:eighties_compute = 1
endif

function! eighties#EightiesResize()
  if g:eighties_enabled && !s:in_file_browser()
    let l:size = s:new_width()

    if l:size > s:current_width()
      exec "silent vertical resize " . l:size
    end
  endif
endfunction

function! s:in_file_browser()
  for pattern in ["NERD_tree", "vimpanel"]
    if bufname("%") =~ pattern
      return 1
    endif
  endfor

  return
endfunction

function! s:new_width()
  return g:eighties_minimum_width + s:total_left_width() + g:eighties_extra_width
endfunction

function! s:current_width()
  return winwidth(0)
endfunction

function! s:total_left_width()
  if !(g:eighties_compute)
    return 0
  endif

  return s:sign_width() + s:line_number_width() + s:extra_space_width()
endfunction

function! s:sign_width()
  let l:current_file = expand("%p")

  if !bufexists(l:current_file) || !filereadable(l:current_file)
    return 0
  endif

  redir => signs
  silent exe ":sign place file=" . l:current_file
  redir END

  if len(split(signs, '\n')) >= 3
    return 2
  endif

  return 0
endfunction

function! s:line_number_width()
  if !(&number)
    return 0
  endif

  let l:numberwidth = &numberwidth
  let l:smallestwidth = strlen(line('$'))

  return s:max([l:smallestwidth, l:numberwidth])
endfunction

function! s:extra_space_width()
  return 1
endfunction

function! s:max(list)
  let l:max = 0

  for current in a:list
    if current > l:max
      let l:max = current
    endif
  endfor

  return l:max
endfunction
