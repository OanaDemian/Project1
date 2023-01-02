# File: lib/diary_entry.rb
class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @current_word = 0
  end

  def title
    # Returns the title as a string
    return @title
  end

  def contents
    # Returns the contents as a string
    return @contents
  end

  def count_words
    # Returns the number of words in the contents as an integer
    words.length
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    fail "WPM must be positive." unless wpm.positive?
    (count_words.to_f / wpm).ceil
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
    fail "WPM must be positive." unless wpm.positive?
    words_we_could_read = wpm * minutes 
    start_from = @current_word
    end_at = @current_word + words_we_could_read
    word_list = words[start_from...end_at]
    if end_at >= count_words
      @current_word = 0 
    else 
      @current_word = end_at
    end
   word_list.join(" ")
  end

  private
  def words
    @contents.split(" ")
  end
end