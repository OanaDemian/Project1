# require 'oanas_diary.rb'
# require 'diary_entry_2.rb'

# RSpec.describe Diary do
#   describe "integration" do
#     diary = Diary.new
#     diary_entry_2 = DiaryEntry.new("Christmas Shopping List", "Christmas Tree, Baubles, Champagne, Panettone, Christmas Crackers")
#     diary_entry_3 = DiaryEntry.new("The little worm", "It was a sunny winter morning when the small worm decided to take a walk on the wild side of the tree.")
#     diary_entry_4 = DiaryEntry.new("Poem", "Twinkle, twinkle, little star, how I wonder what you are.")
#     diary.add(diary_entry_2)
#     diary.add(diary_entry_3)
#     diary.add(diary_entry_4)
#       context "after adding some diary entries" do
#         it "lists out the entries added" do
#           expect(diary.all).to eq [diary_entry_2, diary_entry_3, diary_entry_4  ]
#         end
#       end 

#     context "word counting behaviour" do
#         it "counts the words in all diary entries" do
#           expect(diary.count_words).to eq 39
#         end
#       end

#       context "when given the number of words the user can read per minute" do
#         it "returns an integer representing an estimate of the user's reading time in minutes of all entries in diary" do
#           expect(diary.reading_time(4)).to eq 10
#         end
#       end

#       context "when given the number of words the user can read per minute and the number of minutes the user has to read" do
#         it "Returns an instance of diary entry representing the entry that is closest to, but not over, the length that 
#         the user could read in the minutes they have available given their reading speed." do
#           expect(diary.find_best_entry_for_reading_time(4, 5)).to eq diary_entry_4
#         end
#       end
#   end
# end