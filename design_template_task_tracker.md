
# Method Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can keep track of my tasks
> I want to check if a text includes the string #TODO.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
  task_tracker(text)
  #return a boolean: true or false
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
#1. 
   task_tracker("#TODO: take out the garbage")
   #=> true
#2. 
   task_tracker("TODO: take out the garbage")
   #=> false
#3. 
   task_tracker("#todo: take out the garbage")
   #=> false
#4. 
  task_tracker("")
   #=> false
#5. 
   task_tracker("       ")
   #=> false


   "FAILURE MESSAGES"
#5.
   task_tracker(123445)
   #=> "ERROR: given wrong type of argument. Add task in text format!"
#6.
   task_tracker("#TODO")
   #=> "ERROR: you forgot to describe the task. Add text to describe task!"


```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
