class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    fail "Error: Title is not text!" unless title.is_a? String
    fail "Error: Contents are not text!" unless contents.is_a? String
    raise "Error: No title given!"    if title    == "" || title.match?(/^\s+$/)
    raise "Error: No contents given!" if contents == "" || contents.match?(/^\s+$/)
    @title = title
    @contents = contents
    @words = contents.split(" ")
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
    @words.count
  end

  def reading_time(wpm) # wpm is an integer representing the number of words the
                        # user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
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
    words_to_read = wpm * minutes
    @current_word
    chunk = @words[@current_word...@current_word + words_to_read].join(" ")
    @current_word += words_to_read
    @current_word = 0 if @current_word >= count_words
    return chunk
  end
end