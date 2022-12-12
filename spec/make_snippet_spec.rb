#A method called make_snippet that takes a string as an argument 
#returns the first five words and then a '...' if there are more than that.# Write a small example as a test.
# Run the test (RED).
# Write enough code to make that test pass.
# Run the test (GREEN).
# Refactor if necessary.
# Return to step 1 and keep going until your program is complete.

require 'make_snippet'

RSpec.describe "make_snippet" do
  context "empty string"
  it "returns an empty string" do
    result = make_snippet("")
    expect(result).to eq ""
  end
 
  context "given a sentence of 4 words" do
  it "returns that string" do
    result = make_snippet("one two three four")
    expect(result).to eq "one two three four"
  end
  end 
  context "given a sentence of 5 words" do
    it "returns the 5 words" do
      result = make_snippet("one two three four five")
      expect(result).to eq "one two three four five"
    end
  end

  context "given a sentence of 6 words" do
    it "returns the first 5 words folowed by ..." do
      result = make_snippet("one two three four five six")
      expect(result).to eq "one two three four five..."
    end
  end
end
