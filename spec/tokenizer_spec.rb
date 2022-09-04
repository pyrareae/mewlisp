RSpec.describe MewLisp::Tokenizer do
  let(:source) {"(begin (define mew 3) (* 1 2))"}
  
  it "tokenizes" do
    expect(MewLisp::Tokenizer.tokenize(source)).to eq(%w[( begin ( define mew 3 ) ( * 1 2 ) )])
  end
end
