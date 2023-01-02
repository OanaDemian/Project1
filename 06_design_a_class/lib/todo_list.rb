class TodoList
  def initialize
    @todo_list = []
  end

  def add_task(todo_task) # todo_task is a string
    # adds todo task to list 
    @todo_list.push(todo_task)
  end

    def mark_complete(task) # task is a string
    # Otherwise, returns a string informing the user the task is complete
    # Updates and returns list of the remaining tasks
      
      fail "Unknown task." unless @todo_list.include?(task)
      @todo_list.reject!{|item| item == task}
      "#{task} task complete!"
    end

    def list
      # returns list of todo tasks
      return @todo_list
    end
end