module MewLisp
  class List
    attr_accessor :list
    attr_accessor :env

    def initialize
      @list = []
    end

    def self.new_root
      list = new
      list.env = Environment.new
    end

    def self.new_child parent
      list = new
      list.env = Environment.new parent: parent.env
    end

    def append_child_list
      nl = List.new_child(self)
      @list << nl
      nl
    end

    def head
      @list.first
    end
  end
end