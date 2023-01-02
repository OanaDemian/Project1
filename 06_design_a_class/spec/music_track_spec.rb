require 'music_track'

RSpec.describe MusicTracks do

  context "when user listens to a new track" do
    music_list = MusicTracks.new
    music_list.add("Jingle Bells") 
    it "adds the listened to track to list" do 
      expect(music_list.tracks_list).to eq ["Jingle Bells"]
    end
  end

  context "when user listens to three new tracks" do
    music_list = MusicTracks.new
    music_list.add("12 days of Christmas")
    music_list.add("Rudolf the red nosed reindeer")
    music_list.add("Jingle Bells") 
    it "adds the listened to track to list" do 
      expect(music_list.tracks_list).to eq ["12 days of Christmas", "Rudolf the red nosed reindeer", "Jingle Bells"]
    end
  end

  context "when user wants to see the list of tracks listened to" do
    music_list = MusicTracks.new
    music_list.add("12 days of Christmas")
    music_list.add("Rudolf the red nosed reindeer")
    music_list.add("It's beginning to look a lot like Christmas") 
    music_list.add("Jingle Bells") 
    it "lists the tracks" do 
      expect(music_list.tracks_list).to eq ["12 days of Christmas", "Rudolf the red nosed reindeer", "It's beginning to look a lot like Christmas", "Jingle Bells"]
    end
  end

  context "when user provides music track in incorect format" do
    music_list = MusicTracks.new
    it "fails" do
      expect{music_list.add(12345)}.to raise_error "ERROR: incorrect argument type. Please put track name in text format."
    end
  end

  context "when user gives an empty string" do
    music_list = MusicTracks.new
    it "fails" do
      expect{music_list.add("")}.to raise_error "ERROR: No track given!"
    end
  end


  context "when user gives a track that is already in the list" do
    music_list = MusicTracks.new
    music_list.add("12 days of Christmas")
    music_list.add("Rudolf the red nosed reindeer")
    music_list.add("It's beginning to look a lot like Christmas") 
    music_list.add("Jingle Bells") 
    it "fails" do
      expect{music_list.add("12 days of Christmas")}.to raise_error "12 days of Christmas track already in the list!"
      expect{music_list.add("Rudolf the red nosed reindeer")}.to raise_error "Rudolf the red nosed reindeer track already in the list!"
    end
  end
end