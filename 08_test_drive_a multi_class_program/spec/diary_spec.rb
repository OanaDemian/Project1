require "diary"

RSpec.describe Diary do
  context "initially" do
    it "has an empty list of entries" do
      diary = Diary.new
      expect(diary.all).to eq []
    end

    it "has a word count of 0" do
      diary = Diary.new
      expect(diary.count_words).to eq 0
    end

    it "has a reading time of 0" do
      diary = Diary.new
      expect(diary.reading_time(2)).to eq 0
    end

    it "has a best readable entry of nil" do
      diary = Diary.new
      expect(diary.find_best_entry_for_reading_time(2,1)).to eq nil
    end

  end
end