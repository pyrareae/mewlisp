$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'mewlisp'

MewLisp::Cli.new.repl