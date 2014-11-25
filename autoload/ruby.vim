" helpers {{{1
function! s:block_end_line(line)
  " adjusting cursor position so that searchpair works properly
  let save_pos = getpos('.')
  call cursor(a:line, 1)

  let comment_escape = '\v^[^#]*'
  let block_openers = '\zs(<def>|<if>|<do>|<module>|<class>)'
  let start_pattern = comment_escape . block_openers
  let end_pattern = comment_escape . '\zs<end>'
  let skip_pattern = 'getline(".") =~ "\\v\\S\\s<(if|unless)>\\s\\S"'
  let flags = 'nW'
  let end_pos = searchpair(start_pattern, '', end_pattern, flags, skip_pattern)

  call setpos('.', save_pos)
  return end_pos
endfunction

function! s:get_highlight_groups(current_line, line)
  let stack = synstack(a:line, (match(a:current_line, '^\s*\zs'))+1)
  return map(stack, 'synIDattr(v:val,"name")')
endfunction

function! s:alias_line(current_line)
   return a:current_line =~# '^\s*alias'
endfunction

function! s:one_line_method(current_line)
  return a:current_line =~# '^\s*def\s.\{-}\<end\s*$'
endfunction

" fold functions {{{1
function! ruby#fold(line)
  let current_line = getline(a:line)
  if s:alias_line(current_line) ||
   \ s:one_line_method(current_line)
    return 0
  endif

  let highlight_groups = s:get_highlight_groups(current_line, a:line)
  if index(highlight_groups, "rubyMethodBlock", 0, 1) >= 0 ||
   \ index(highlight_groups, "rubyDefine", 0, 1) >= 0 ||
   \ index(highlight_groups, "rubyDocumentation", 0, 1) >= 0
    return 1
  else
    return 0
  endif
endfunction

function! ruby#rspec_fold(line)
  " check if fold end is known
  if b:rspec_fold_end > 0 && a:line <= b:rspec_fold_end
    if a:line ==# b:rspec_fold_end
      let b:rspec_fold_end = 0
    end
    return 1
  endif

  " rspec files also fold by ruby rules
  if ruby#fold(a:line)
    return 1
  endif

  let it_line_regex = '^\s*x\?it\s.\{-}do\s*$'
  " fold starts on an `it` line
  if getline(a:line) =~# it_line_regex
    return 1

  " all the subsequent lines in an `it` block are inside a fold
  elseif getline(a:line-1) =~# it_line_regex
    let b:rspec_fold_end = s:block_end_line(a:line)
    return 1

  " handles a scenario when fold is edited
  elseif foldlevel(a:line-1) > 0 && s:block_end_line(a:line-1) >= a:line
    let b:rspec_fold_end = s:block_end_line(a:line)
    return 1
  endif

  return 0
endfunction
