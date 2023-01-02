# File: lib/todo.rb
class Todo
  def initialize(task) # task is a string
    @task = task
    @done = []
  end

  def task
    # Returns the task as a string
    fail "Please add a todo task!" if @task ==" " || @task == ""
    fail "Please add a todo task in a text format!" unless @task.is_a?(String)
    @task
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing
    @done << @task
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
    @done.include?(@task)
  end
end