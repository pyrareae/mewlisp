module MewLisp
  class Error < StandardError; end
  
  def self.exec_string(source)
    source.then { Tokenizer.tokenize _1 }
          .then { Parser.parse _1 }
          .then { _1 }
  end
end

require "mewlisp/version"
require "mewlisp/atom"
require "mewlisp/tokenizer"
require "mewlisp/parser"
require "mewlisp/environment"
require "mewlisp/cli"
