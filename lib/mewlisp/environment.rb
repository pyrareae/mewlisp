require 'forwardable'

module MewLisp
  class Environment
    extend Forwardable
    attr_accessor :world
    def_delegator @world, :[]
    def_delegator @world, :fetch

    @root = nil

    def initialize parent: nil
      # setup hash to search ancestors
      @world = Hash.new do |hash, key|
        next if is_root?

        hash.fetch(key, parent[key])
      end

      !parent and setup_base_env!
    end

    def setup_base_env!
      raise('root node already exists!') if self.class.root
      self.class.root = self
      # setup basic math and bool ops
      ops = %i[+ - * / > < == >= <=].map do |op|
        [op, -> (a,b) { a.send(op, b) }]
      end.to_h

      math_funcs = {
        'exp'     => -> x { Math.exp x },
        'abs'     => -> x { Numeric(x).abs },
        '+'       => -> x,y { x + y },
        '-'       => -> x,y { x - y },
        '*'       => -> x,y { x * y },
        '/'       => -> x,y { x / y },
      }

      general = {
        'car'     => -> x { x.first },
        'cdr'     => -> x { x.last },
        'not'     => -> x { !x },
        'apply'   => -> procc, args { procc.call *args }
      }
      ## unary ops
      %i[first last max min length].each do |op|
        general[op] = -> x { x.send(op) }
      end

      ## add groups to world env
      [ops, math_funcs].each{@world.merge! _1}
    end

    def is_root?
      self == self.class.root
    end
  end
end
