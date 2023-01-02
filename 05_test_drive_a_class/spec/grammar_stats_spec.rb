# require 'grammar_stats'

# RSpec.describe GrammarStats do
#    context "grammar stats" do
#     grammar_stats = GrammarStats.new
#     it "checks correctly capitalised and punctuated text and returns true" do
#       expect(grammar_stats.check("Hello, world.")).to eq true
#     end

#     it "checks correctly capitalised and punctuated text and returns true" do
#       expect(grammar_stats.check("Hello, world.")).to eq true
#     end

#     it "returns percentage of texts checks that passed" do
#       expect(grammar_stats.percentage_good).to eq 100
#     end

#     it "checks incorrectly capitalised text and returns false" do
#       expect(grammar_stats.check("hello, world.")).to eq false
#     end


#     it "returns percentage of texts checks that passed" do
#       expect(grammar_stats.percentage_good).to eq 66
#     end

#     it "checks incorrectly punctuated text and returns false" do
#       expect(grammar_stats.check("Hello, world")).to eq false
#     end

#     it "returns percentage of texts checks that passed" do
#       expect(grammar_stats.percentage_good).to eq 50
#     end

#    end
# end