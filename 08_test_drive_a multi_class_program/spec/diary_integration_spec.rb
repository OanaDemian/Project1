require "diary"
require "diary_entry"

RSpec.describe "integration" do
  context "after adding some entries" do
    it "lists out the entries added" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title", "my contents")
      diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.all).to eq [diary_entry_1, diary_entry_2]
    end
  end

  describe "word counting behaviour" do
    it "counts the words in all diary entries contents" do 
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title", "my contents")
      diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.count_words).to eq 5
    end
  end
 
  describe "reading time behaviour" do
    it "fails when wpm is 0" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title", "my contents 1")
      diary.add(diary_entry_1)
      expect{diary.reading_time(0)}.to raise_error "WPM must be positive"
    end

    it "calculates the reading time for all entries" do 
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title", "my contents 1")
      diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.reading_time(2)).to eq 3
    end
  end

  describe "best reading time entry behaviour" do

    it "fail where wpm is 0" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title", "my contents 1")
      diary.add(diary_entry_1)
      expect{diary.find_best_entry_for_reading_time(0, 2)}.to raise_error "WPM must be positive."
    end
    context "where we just have one entry that is readable in the given time" do
      it "returns that entry" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("my title", "my contents 1")
        diary.add(diary_entry_1)
        result = diary.find_best_entry_for_reading_time(3, 1)
        expect(result).to eq diary_entry_1
      end
    end

    context "where we just have one entry that is unreadable in the given time" do
      it "returns nil" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("my title", "my contents 1")
        diary.add(diary_entry_1)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq nil
      end
    end

    context "where we have multiple entries" do
      it "returns the longest entry you can read in this time" do
        diary = Diary.new
        diary.add(DiaryEntry.new("my_title", "one"))
        diary.add(DiaryEntry.new("my_title", "one, two"))
        diary.add(DiaryEntry.new("my_title", "one, two, three"))
        diary.add(DiaryEntry.new("my_title", "one, two, three, four"))
        diary.add(DiaryEntry.new("my_title", "one, two, three, four, five"))
        diary.add(DiaryEntry.new("my_title", "one, two, three, four, five, six"))
        best_entry = DiaryEntry.new("my_title", "one, two, three, four, five, six, seven")
        diary.add(best_entry)
        result = diary.find_best_entry_for_reading_time(4, 2)
        expect(result).to eq best_entry
      end
    end 
  end

  describe "#reading chunk" do
    context "with a contents readable within the given minutes" do
      it "returns the full contents" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        chunk = diary_entry.reading_chunk(200, 1)
        expect(chunk).to eq "one two three"
      end
    end
    
    context "given a wpm of 0"  do
      it "fails" do 
        diary_entry = DiaryEntry.new("my title", "my contents 1")
        expect{diary_entry.reading_chunk(0, 2)}.to raise_error "WPM must be positive."
      end
    end 

    context "with a contents unreadable within the time" do
      it "returns a readable chunk" do
        diary_entry = DiaryEntry.new("my_title", "one two three four five six seven eight nine ten")
        chunk = diary_entry.reading_chunk(2, 2)
        expect(chunk).to eq "one two three four"
      end

      it "returns the next chunk, next time we are asked" do
        diary_entry = DiaryEntry.new("my_title", "one two three four five six seven eight nine ten")
        diary_entry.reading_chunk(1,2)
        diary_entry.reading_chunk(2,2)
        expect(diary_entry.reading_chunk(3, 1)).to eq "seven eight nine"
      end

      it "restarts after reading whole contents" do
        diary_entry = DiaryEntry.new("my_title", "one two three four five")
        diary_entry.reading_chunk(2,1)
        diary_entry.reading_chunk(2,2)
        chunk = diary_entry.reading_chunk(1, 3)
        expect(chunk).to eq "one two three"
      end

      it "restarts if it finishes exactly on the end" do
        diary_entry = DiaryEntry.new("my_title", "one two three four five six seven")
        diary_entry.reading_chunk(2,2)
        diary_entry.reading_chunk(3,1)
        chunk = diary_entry.reading_chunk(2, 3)
        expect(chunk).to eq "one two three four five six"
      end
     

    end
  end
end
