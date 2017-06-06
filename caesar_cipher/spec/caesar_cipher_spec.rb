require "caesar_cipher.rb"

describe 'caesar_cipher' do

  it "performs cipher on a string" do
    expect(caesar_cipher("hello")).to eql("ifmmp")
  end

  it "only affects letters" do
    expect(caesar_cipher("a1b2c6??a",2)).to eql("c1d2e6??c")
  end

  it "maintains letter case" do
    expect(caesar_cipher("AbCdEfG",1)).to eql("BcDeFgH")
  end

  it "wraps around the end of the alphabet" do
    expect(caesar_cipher("xYz",4)).to eql("bCd")
  end


end