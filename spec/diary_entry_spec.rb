require 'diary_entry'

RSpec.describe "diary_entry method" do
  context "when given a title and its contents" do
    diary = DiaryEntry.new("GP Practice", "020 212 333")
  
    it "returns the title" do
      expect(diary.title).to eq "GP Practice"
    end

    it "returns the contents" do
      expect(diary.contents).to eq "020 212 333"
    end

    it "returns no. of words in contents" do
      expect(diary.count_words).to eq 3
    end

    it "returns estimate of reading contents in minutes when wpm is given" do
      expect(diary.reading_time(200)).to eq 1
    end

    it "returns estimate of reading contents in minutes when wpm is given" do
      expect(diary.reading_time(1)).to eq 3
    end
  end

  context "when given wpm and no. of mins user has to read" do
    diary = DiaryEntry.new("Letter to Santa", "Dear Santa, for Christmas I would like to receive a new jumper.")

    it "returns contents that user can read in that time" do
      expect(diary.reading_chunk(2, 2)).to eq "Dear Santa, for Christmas"
    end

    it "skips content already read and returns next contents to be read" do
      expect(diary.reading_chunk(2, 3)).to eq "I would like to receive a"
    end

    it "returns last words from content" do
      expect(diary.reading_chunk(2, 4)).to eq "new jumper."
    end

    it "starts from beginning after all content read" do
      expect(diary.reading_chunk(3, 3)).to eq "Dear Santa, for Christmas I would like to receive"
    end
  end

  context "fails if" do
    it "title is not a string" do
      expect{ DiaryEntry.new(1234, "adsfadsf") }.to raise_error "Error: Title is not text!"
    end

    it "contents are not a string" do
      expect{ DiaryEntry.new("adsfadsf", 1234) }.to raise_error "Error: Contents are not text!"
    end

    it "title is empty" do
      expect{ DiaryEntry.new("", "asda") }.to raise_error "Error: No title given!"
    end

    it "contents are empty" do
      expect{ DiaryEntry.new("asda", "") }.to raise_error "Error: No contents given!"
    end

    it "title is empty" do
      expect{ DiaryEntry.new("    ", "asda") }.to raise_error "Error: No title given!"
    end

    it "contents are empty" do
      expect{ DiaryEntry.new("asda", "    ") }.to raise_error "Error: No contents given!"
    end
  end
end