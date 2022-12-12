require 'time_manager'

RSpec.describe "time_manager method" do
  it "takes one word and rounds up to a minute" do
    result = time_manager("one")
    expect(result).to eq 1
  end

  it "takes 200 words and returns 1 minute" do
    TWO_HUNDRED_WORDS = (["sample"] * 200).join(" ")
    result = time_manager(TWO_HUNDRED_WORDS)
    expect(result).to eq 1
  end
  
  it "takes 300 words and rounds up to 2 minutes" do
    THREE_HUNDRED_WORDS = (["sample"] * 300).join(" ")
    result = time_manager(THREE_HUNDRED_WORDS)
    expect(result).to eq 2
  end

  it "takes 4000 words and returns 20 minutes" do
    FOUR_THOUSANDS_WORDS = (["sample"] * 4000).join(" ")
    result = time_manager(FOUR_THOUSANDS_WORDS)
    expect(result).to eq 20
  end

  context "when string is empty" do
    it "fails" do
        expect{ time_manager("") }.to raise_error "Please enter some text!"
    end
  end
  
  context "when string consist of multiple spaces" do
    it "fails" do
        expect{ time_manager("     ") }.to raise_error "Please enter some text!"
    end
  end

 context "when given something other than string" do
    it "fails" do
        expect{ time_manager(12345) }.to raise_error "Incorrect input type: please enter text!"
    end
  end
end