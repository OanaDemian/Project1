# {{MusicTracks}} Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can keep track of my music listening
> I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface

Include the initializer and public methods with all parameters and return values.

```ruby
# EXAMPLE

class MusicTracks

  def initialize
    #...
  end

  def add(listened_to_tracks) #listened_to_tracks is a string
    # adds new music track to list
    # throws an error message if the track is already in the list 
    # throws an error message if the track is in incorrect format
  end

  def tracks_list
    # => returns an array of all the tracks i have listened to
  end

end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations.

```ruby
# EXAMPLE

# 1 Adds one music track to list of listened to tracks
music_list = MusicTrack
music_list.add("Jingle Bells") 
# adds "Jingle bells" track to list

# 2 Adds three music tracks to the list of listened to tracks

music_list = MusicTracks.new
music_list.add("12 days of Christmas")
  # adds "12 days of Christmas" track to list
music_list.add("It's beginning to look a lot like Christmas") 
  # adds "It's beginning to look a lot like Christmas" track to list
music_list.add("Rudolf the red nosed reindeer")
  # adds "Rudolf the red nosed reindeer" track to list

# 3 Lists music tracks
music_list = MusicTrack
music_list.add("12 days of Christmas")
  # adds "12 days of Christmas" track to list
music_list.add("It's beginning to look a lot like Christmas") 
  # adds "It's beginning to look a lot like Christmas" track to list
music_list.add("Rudolf the red nosed reindeer")
  # adds "Rudolf the red nosed reindeer" track to list
music_list.add("12 days of Christmas")
  # adds "12 days of Christmas" track to list
music_list.tracks_list 
  # => list of listened tracks to the user  


#  4. FAILURE MESSAGES: throws an error message if track in any other format than string.
music_list.add(1234)
  #=> fails with "ERROR: incorrect argument type. Please put track name in text format."

#  5. FAILURE MESSAGES: throws an error message if track is an empty string.
music_list.add("")
  # => fails with ERROR: No track given!

  #6. Fails with error #track name already in the list!
  music_list.add("12 days of Christmas")
  # adds "12 days of Christmas" track to list
music_list.add("It's beginning to look a lot like Christmas") 
  # adds "It's beginning to look a lot like Christmas" track to list
music_list.add("Rudolf the red nosed reindeer")
  # adds "Rudolf the red nosed reindeer" track to list
music_list.add("12 days of Christmas")
  # => fails with error #track name already in the list!
```

Encode each example as a test. You can add to the above list as you go.

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
