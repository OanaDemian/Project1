require "todo"

RSpec.describe Todo do
  #consider the case of incorrect type todo task
  it "constructs" do
    todo_task_1 = Todo.new("task_1")
    expect(todo_task_1.task).to eq "task_1"
  end

  context "task is not a string" do
    it "gives an error message" do
      todo_task_1 = Todo.new(1234)
      expect{todo_task_1.task}.to raise_error "Please add a todo task in a text format!"
    end
  end

  context "task is empty" do
    it "gives an error message" do
      todo_task_1 = Todo.new("")
      expect{todo_task_1.task}.to raise_error "Please add a todo task!"
    end

    it "gives an error message" do
      todo_task_1 = Todo.new(" ")
      expect{todo_task_1.task}.to raise_error "Please add a todo task!"
    end

    it "gives an error message when todo is greater than 256 characters" do
      string_257_chars = "VwFgXy6ZOdmUWA9cC97Wqk5zUrINAjXmZEAjgkimwPYOZkzHhvwY0n3khv5pIIcXCuvzfxd4NyQMyCB6J09eYyxEQmRRn6VCkDr03O1slpRqbHCPlIyRwKBdvmxYalO1raz4E9tGSm3UxAmRxG1dy3CZ1PyAbU4SS9IivPDkHm963q41wNxcrLeQZBZjm2U1CWTUT4oSmcP5L80YF7IZOkBMksn1nIuivaLk4IL2J2ZPhIHC1OYV5OqWgPdx7HssK"
      todo_task_1 = Todo.new(string_257_chars)
      expect{todo_task_1.task}.to raise_error "Task text must be less than 256 characters!"
    end
  end
   
  context "done?" do
    it "checks if the todo task is done or not" do
      todo_task_1 = Todo.new("task_1")
      todo_task_1.mark_done!
      todo_task_2 = Todo.new("task_2")
      expect(todo_task_1.done?).to eq true
      expect(todo_task_2.done?).to eq false
    end
  end
end