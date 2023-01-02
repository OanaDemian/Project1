# require 'diary_entry_2'

# RSpec.describe DiaryEntry do
#   context "when given title and contents" do
#     diary_entry_2 = DiaryEntry.new("Christmas Shopping List", "Christmas Tree, Baubles, Champagne, Panettone, Christmas Crackers")
#     diary_entry_0 = DiaryEntry.new("my_title", "")
#     it "returns title" do
#       expect(diary_entry_2.title).to eq "Christmas Shopping List"
#     end

#     it "returns contents" do
#       expect(diary_entry_2.contents).to eq "Christmas Tree, Baubles, Champagne, Panettone, Christmas Crackers"
#     end

#     it "returns the number of words in contents as integer" do
#       expect(diary_entry_2.count_words).to eq 7
#     end

#     it "returns 0 if contents is empty" do
#       expect(diary_entry_0.count_words).to eq 0
#     end
#   end

#     context "when given title, contents and words per minute" do
#       diary_entry_3 = DiaryEntry.new("The little worm", "It was a sunny winter morning when the small worm decided to take a walk on the wild side of the tree.")
#       it "returns an estimate of the reading time for contents in minutes" do
#         expect(diary_entry_3.reading_time(3)).to eq 8
#       end
#     end    

#     context "when given words per minute and number of minutes a user has to read" do
#       diary_entry_3 = DiaryEntry.new("The little worm", "It was a sunny winter morning when the small worm decided to take a walk on the wild side of the tree.")
#       it "returns a string with a chunk of the contents that the user could read in the given number of minutes" do
#         expect(diary_entry_3.reading_chunk(3,3)).to eq "It was a sunny winter morning when the small"
#         expect(diary_entry_3.reading_chunk(2,3)).to eq "worm decided to take a walk"
#         expect(diary_entry_3.reading_chunk(2,4)).to eq "on the wild side of the tree."
#         expect(diary_entry_3.reading_chunk(2,4)).to eq "It was a sunny winter morning when the"
#       end
#     end   
# end