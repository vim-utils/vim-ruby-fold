# ruby-fold.vim

Simple folding for `ruby` and `rspec` files.

Official [vim-ruby](https://github.com/vim-ruby/vim-ruby) plugin has too
granular fold support. Every if statement, block, method, class, module and
multi-line comment are folded.<br/>
The downside of this is that you might find yourself working too much through
the folds to get to the actual code.

This plugin folds \*only* ruby methods. In `rspec` files, `it` blocks are
folded.

Benefits:
- it's easy to get to the "actual code" because folds are always just one level
  deep
- high-level file overview stays clean and readable because the code
  implementation within the methods is folded

### Installation

Just use your favorite plugin manager.

### Options

Folds computation is slow for big files. This might result in noticeable lag
when opening ruby files.

The solution to this is to limit fold creation only for small ruby files.
The following option

    let g:ruby_fold_lines_limit = 200

will only fold ruby files if they have less than 200LOC.

### License

[MIT](LICENSE.md)
