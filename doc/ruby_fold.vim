*ruby_fold.txt*	simple folding for ruby and rspec files

Author: Bruno Sutic <https://www.github.com/bruno->

ABOUT						*ruby-fold*

Simple folding for ruby and rspec files.

Official vim-ruby plugin has fold support with |ruby_fold|. Unfortunately, the
folds produced by that plugin are too "granular". Every if statement, block,
method, class, module and multi-line comment are folded.
In the end, you might find yourself working too much through the folds to
get to the actual code.

FEATURES					*ruby-fold-features*

|ruby-fold| folds only ruby methods. In rspec files, "it" blocks are folded.

CONTRIBUTING					*ruby-fold-contributing*

Contributing and bug reports are welcome. Github repo:

  https://github.com/bruno-/vim-ruby-fold

LICENSE						*ruby-fold-license*

Copyright (c) Bruno Sutic. Distributed under the MIT license.

vim:tw=78:ts=8:ft=help:norl:
