module MewLisp
  module Parser
    extend self

    class ParseError < MewLisp::Error; end

    def build_tree(tokens)
      tokens = tokens.dup
      stack = []
      tree = head = []

      while tokens.any?
        token = tokens.shift

        head.nil? and raise ParseError, "head is nil"

        case token
        when '('
          node = []
          head << node
          head = node
          stack << head
        when ')'
          stack.pop
          head = stack.last if stack.any?
        else
          head << token
        end
      end

      stack.empty? or raise ParseError, 'Open/close paren mismatch!'
      tree
    end

    def populate_tree(tree)
      pp tree
    end

    def parse(tokens)
      tokens.then { build_tree _1}
            .then { populate_tree _1 }
    end
  end
end
