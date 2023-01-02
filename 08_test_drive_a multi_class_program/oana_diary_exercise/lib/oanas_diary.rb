# File: lib/diary.rb
class Diary
  def initialize
    @all_diary_entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Returns nothing
    @all_diary_entries << entry
  end

  def all
    # Returns a list of instances of DiaryEntry
    return @all_diary_entries
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
    @all_diary_entries.sum(init=0){|entry| entry.count_words}
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
    (count_words.to_f/ wpm).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
    words_to_read = wpm * minutes
    # arr = @all_diary_entries.select{ 
    #   |entry| entry.count_words <= words_to_read}
    # arr.max{|entry| entry.count_words}
  #   closest_entry = @all_diary_entries[0]
  #   @all_diary_entries.each do |entry|
  #     next unless entry.count_words <= words_to_read 
  #     next unless closest_entry entry.count_words > closest_entry.count_words
  #     closest_entry = entry
  #   end
  #   return closest_entry

    @all_diary_entries.reduce(nil) do |best_read, entry|
      next best_read unless entry.count_words <= words_to_read 
      next entry if best_read.nil?
      entry.count_words > best_read.count_words ? entry : best_read
    end
  end
end

diary = Diary.new
    diary_entry_2 = DiaryEntry.new("Christmas Shopping List", "Christmas Tree, Baubles, Champagne, Panettone, Christmas Crackers")
    diary_entry_3 = DiaryEntry.new("The little worm", "It was a sunny winter morning when the small worm decided to take a walk on the wild side of the tree.")
    diary_entry_4 = DiaryEntry.new("Poem", "Twinkle, twinkle, little star, how I wonder what you are.")
    diary.add(diary_entry_2)
    diary.add(diary_entry_3)
    diary.add(diary_entry_4)
