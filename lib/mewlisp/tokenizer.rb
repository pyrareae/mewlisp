module MewLisp
  module Tokenizer
    extend self

    def tokenize(source)
      source
        .gsub(')', ' ) ')
        .gsub('(', ' ( ')
        .split(' ')
    end
  end
end
