class MusicTracks

  def initialize
    @tracks_listened = []
  end

  def add(listened_to_track) #listened_to_tracks is a string
    # adds new music track to list
    # throws an error message if the track is already in the list 
    # throws an error message if the track is in incorrect format
    fail "ERROR: incorrect argument type. Please put track name in text format." unless listened_to_track.is_a?(String)
    fail "ERROR: No track given!" if listened_to_track == ""
    fail "#{listened_to_track} track already in the list!" if @tracks_listened.include?(listened_to_track)
    @tracks_listened << listened_to_track
  end

  def tracks_list
    # => returns an array of all the tracks i have listened to
    @tracks_listened
  end

end