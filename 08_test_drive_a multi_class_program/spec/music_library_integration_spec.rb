# File: spec/music_library_integration_spec.rb
require 'music_library'
require 'track'
RSpec.describe "Music Library Integration" do
  # it "gets all tracks" do
  #   library = MusicLibrary.new
  #   track_1 = Track.new("Carte Blanche", "Veracocha")
  #   track_2 = Track.new("Synaesthesia", "The Thrillseekers")
  #   library.add(track_1)
  #   library.add(track_2)
  #   expect(library.search_by_title("Carte")).to eq [track_1]
  # end
  context "when we add a track to the library" do
    it "comes back in the list" do
      music_library = MusicLibrary.new
      track_1 = Track.new("my_music_1", "my_artist_1")
      track_2 = Track.new("my_music_2", "my_artist_2")
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.all).to eq [track_1, track_2]
    end
  end

  context "with some tracks added" do
    it "searches for those tracks by full title" do
      music_library = MusicLibrary.new
      track_1 = Track.new("my_music_1", "my_artist_1")
      track_2 = Track.new("my_music_2", "my_artist_2")
      track_3 = Track.new("All I want for Xmas is chocolate", "Oana")
      music_library.add(track_1)
      music_library.add(track_2)
      music_library.add(track_3)
      expect(music_library.search_by_title("music")).to eq [track_1, track_2]
      expect(music_library.search_by_title("chocolate")).to eq [track_3]
    end
  end
end