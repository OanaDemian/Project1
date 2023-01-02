# File: lib/todo_list.rb
class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
    fail "Please add a todo task!" if todo.task == "" || todo.task == " "
    @todo_list << todo
  end

  def incomplete
    # Returns all non-done todos
    @todo_list.select{|item| item.done? == false}
  end

  def complete
    # Returns all complete todos
    @todo_list.select{|item| item.done?}
  end

  def give_up!
    # Marks all todos as complete
    @todo_list.map{|item| item.mark_done!}
  end
end

