
# {{TodoList}} Class Design Recipe

## 1. Describe the Problem
  > As a user
  > So that I can keep track of my tasks
  > I want a program that I can add todo tasks to and see a list of them.

  > As a user
  > So that I can focus on tasks to complete
  > I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface

Include the initializer and public methods with all parameters and return values.

```ruby
# TodoList Class

class TodoList
  def initialize
    # ...
  end

  def add_task(todo_task) # todo_task is a string
    # adds todo task to list 
  end

  def mark_complete(task) # task is a string
    # Throws an exception if no task is set
    # Fails if the task doesn't exist
    # Otherwise, returns a string informing the user the task is complete
    # Updates the list of the remaining tasks 
  end

  def list
    # returns list of todo tasks added as strings
    # except the completed ones
  end

end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations.

```ruby
# EXAMPLE

# 1 Given a task adds the task to the list
todo_list = TodoList
todo_list.add_task("walk the dog")      # => ["walk the dog"]

# 2 Given two tasks adds them both to the list
todo_list = TodoList
todo_list.add_task("walk the dog")      # => ["walk the dog"]
todo_list.add_task("take out the bin bags")  # => ["walk the dog", "take out the bin bags"]

# 3 When task completed removes task from list
todo_list = TodoList
todo_list.mark_complete("walk the dog") # => "walk the dog task complete!"           
#deletes completed task from list

# 4 When try to complete a non exitent task
todo_list.mark_complete("hoover") # => fails with "Unknown task."
todo_list.mark_complete("walk the dog") # => fails with "Unknown task."

```

Encode each example as a test. You can add to the above list as you go.

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
