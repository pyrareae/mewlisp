require "bundler/setup"
require "mewlisp"

source = "(begin (define mew 3) (* 1 2))"

pp MewLisp::Tokenizer.tokenize(source)
                     .then{MewLisp::Parser.build_tree _1}
