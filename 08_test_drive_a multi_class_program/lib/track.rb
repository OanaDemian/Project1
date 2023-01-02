# File: lib/track.rb

class Track
  def initialize(title, artist) # title and artist are both strings
    @title = title
    @artist = artist
  end

  def title
    # Returns the title as a string
    @title
  end

  def format
    # Returns a string of the form "TITLE by ARTIST"
  "#{@title.upcase} by #{@artist.upcase}"
  end
end