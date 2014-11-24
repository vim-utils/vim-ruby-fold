if exists('g:loaded_ruby_fold') || &cp
  finish
endif
let g:loaded_ruby_fold = 1

if has("autocmd")
  augroup ruby_fold
    autocmd!
    autocmd FileType ruby
          \ if expand('%:t') =~# '_spec.rb$' |
          \   let b:rspec_fold_end = 0 |
          \   setlocal foldexpr=ruby#rspec_fold(v:lnum) foldmethod=expr |
          \ else |
          \   setlocal foldexpr=ruby#fold(v:lnum) foldmethod=expr |
          \ endif
  augroup END
endif
