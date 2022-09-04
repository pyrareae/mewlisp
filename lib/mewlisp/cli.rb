require "readline"

module MewLisp
  class Cli
    def repl
      while buf = Readline.readline("MewL>> ", true)
        puts(MewLisp.exec_string(buf))
      end
    end
  end
end
