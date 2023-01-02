# File: lib/music_library.rb

class MusicLibrary
  def initialize
    @library = []
  end

  def add(track) # track is an instance of Track
    # Track gets added to the library
    # Returns nothing
    @library << track
  end

  def all
    # Returns a list of track objects
    return @library
  end
  
  def search_by_title(keyword) # keyword is a string
    # Returns a list of tracks with titles that include the keyword
    @library.select{|track| track.title.include?(keyword)}
  end
end