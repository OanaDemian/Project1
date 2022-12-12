require 'count_words'

RSpec.describe "count_words method" do
    it "takes in text and returns correct no. of words." do
        result = count_words("It is a snowy day.")
        expect(result).to eq 5
    end

    context "when string is empty" do
        it "fails" do
            expect{ count_words("") }.to raise_error "Please enter some text!"
        end
    end

    context "when string consist of multiple spaces" do
        it "fails" do
            expect{ count_words("     ") }.to raise_error "Please enter some text!"
        end
    end

    context "when given something other than string" do
        it "fails" do
            expect{ count_words(12345) }.to raise_error "Incorrect input type: please enter text!"
        end
    end

    
end