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

### License

[MIT](LICENSE.md)
