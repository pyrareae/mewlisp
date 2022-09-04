RSpec.describe MewLisp::Parser do
  let(:source) {"(begin (define mew 3) (* 1 2))"}

  it 'should build tree' do
    tree = MewLisp::Tokenizer.tokenize(source)
            .then{MewLisp::Parser.build_tree _1}
  end
end