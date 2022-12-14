require 'diary_entry'

RSpec.describe "diary_entry method" do
  it "returns the title when given a title and its contents" do
    diary = DiaryEntry.new("GP Practice", "020 212 333")
    expect(diary.title).to eq "GP Practice"
  end

  it "returns the contents when given a title and its contents" do
    diary = DiaryEntry.new("GP Practice", "020 212 333")
    expect(diary.contents).to eq "020 212 333"
  end
end