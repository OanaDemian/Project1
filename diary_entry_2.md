
# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._



## 2. Design the Class Interface

Include the initializer and public methods with all parameters and return values.




## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations. 

```ruby

diary_entry_2 = DiaryEntry.new("Christmas Shopping List", "Christmas Tree, Baubles, Champagne, Panettone, Christmas Crackers")
diary_entry_3 = DiaryEntry.new("It was a sunny winter morning", "when the small worm decided to take a walk on the wild side of the tree.")
diary_entry_2.title 
# =>"Christmas Shopping List"
diary_entry_2.contents 
#=>"Christmas Tree, Baubles, Champagne, Panettone, Christmas Crackers"
diary_entry_2.count_words 
#=>7
diary_entry_2.reading_time(4) 
#=>2
diary_entry_2.reading_chunk(4, 1) 
#=> Christmas Tree, Baubles, Champagne" => "Panettone, Christmas Crackers"


diary = Diary.new
diary.add(diary_entry_2)
diary_entry.add(diary_entry_3)
diary_entry.all  
#=>[diary_entry_2, diary_entry_3]
diary_entry.count_words 
#=>29 
diary_entry.reading_time(4) 
#=>8
diary_entry.find_best_entry_for_reading_time(4,5)
#=>"Christmas Shopping List, Christmas Tree, Baubles, Champagne, Panettone, Christmas Crackers It was a sunny winter morning, when the small worm"

```

Encode each example as a test. You can add to the above list as you go.


## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
