if exists('g:loaded_ruby_fold') || &cp
  finish
endif
let g:loaded_ruby_fold = 1

if has("autocmd")
  augroup ruby_fold
    autocmd!
    autocmd FileType ruby
          \ if !exists('g:ruby_fold_lines_limit') || line('$') < g:ruby_fold_lines_limit |
          \   if expand('%:t') =~# '_spec.rb$' |
          \     let b:rspec_fold_end = 0 |
          \     setlocal foldexpr=ruby#rspec_fold(v:lnum) foldmethod=expr |
          \   else |
          \     setlocal foldexpr=ruby#fold(v:lnum) foldmethod=expr |
          \   endif |
          \ endif
  augroup END
endif
