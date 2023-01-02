require 'check_grammar'

RSpec.describe 'check_grammar method' do
    it 'takes correctly punctuated and capitalised sentence and returns true' do
        result = check_grammar?("It is a snowy day.")
        expect(result).to eq true
    end

    it 'takes incorrectly punctuated sentence and returns false' do
        result = check_grammar?("It is a snowy day")
        expect(result).to eq false
    end

    it 'takes incorrectly capitalised sentence and returns false' do
        result = check_grammar?("it is a snowy day.")
        expect(result).to eq false
    end

    it 'takes correctly punctuated and capitalised sentence and returns true' do
        result = check_grammar?("It is a snowy day!")
        expect(result).to eq true
    end
end