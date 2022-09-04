RSpec.describe MewLisp do
  it "has a version number" do
    expect(MewLisp::VERSION).not_to be nil
  end

  it "should run simple script with function" do
    script = <<-SCRIPT
      (let mew (-> "meow")
        (mew)
      )
    SCRIPT

    expect(MewLisp.exec_string(script)).to eq "meow"
  end

  it "should perform addition" do
    expect(MewLisp.exec_string("(+ 4 2 1)")).to eq 7
  end
end
