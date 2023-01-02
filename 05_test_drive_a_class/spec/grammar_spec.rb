require 'grammar'

RSpec.describe GrammarStats do
  context "when given a piece of text" do
    grammar_stats = GrammarStats.new
    it "returns true if text is correctly capilalised and punctuated and false otherwise" do
      
      result = grammar_stats.check("It was a cold and snowy night when the mighty owl woke up, wandered away from his tree and wooshed into the darkness.")
      expect(result).to eq true
    end

    it "returns an integer representing the percentage of texts correctly capitalised and punctuated" do
      result = grammar_stats.percentage_good
      expect(result).to eq 100
    end

    it "returns false if text is incorrectly capilalised" do
      result = grammar_stats.check("it was a cold and snowy night when the mighty owl woke up, wandered away from his tree and wooshed into the darkness.")
      expect(result).to eq false
    end
  
    it "returns an integer representing the percentage of texts correctly capitalised and punctuated" do
      result = grammar_stats.percentage_good
      expect(result).to eq 50
    end

    it "returns false if text is incorrectly punctuated" do
      result = grammar_stats.check("It was a cold and snowy night when the mighty owl woke up, wandered away from his tree and wooshed into the darkness")
      expect(result).to eq false
    end
  
    it "returns an integer representing the percentage of texts correctly capitalised and punctuated" do
      result = grammar_stats.percentage_good
      expect(result).to eq 33
    end

  end
end
