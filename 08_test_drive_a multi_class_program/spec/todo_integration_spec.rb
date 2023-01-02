require "todo"
require "todo_list"

RSpec.describe "integration" do
  context "when we add a todo task to the list" do
    it "comes back in the list of incomplete todo tasks" do
      task_list = TodoList.new
      todo_task_1 = Todo.new("hoover the floors")
      todo_task_2 = Todo.new("dust the furniture")
      todo_task_3 = Todo.new("clean the kitchen")
      todo_task_4 = Todo.new("take out the bin bags")
      task_list.add(todo_task_1)
      todo_task_1.mark_done!
      task_list.add(todo_task_2)
      todo_task_2.mark_done!
      task_list.add(todo_task_3)
      task_list.add(todo_task_4)
      expect(task_list.incomplete).to eq [todo_task_3, todo_task_4]
    end

    it "gives an error message when todo is an empty text" do
      task_list = TodoList.new
      expect{task_list.add(Todo.new(""))}.to raise_error "Please add a todo task!" 
    end
    
    it "gives an error message when todo is an empty space" do
      task_list = TodoList.new
      expect{task_list.add(Todo.new(" "))}.to raise_error "Please add a todo task!" 
    end

    it "gives an error message when todo is not a text" do
      task_list = TodoList.new
      expect{task_list.add(Todo.new(1234))}.to raise_error "Please add a todo task in a text format!"
    end

    it "gives an error message when todo is greater than 256 characters" do
      string_257_chars = "VwFgXy6ZOdmUWA9cC97Wqk5zUrINAjXmZEAjgkimwPYOZkzHhvwY0n3khv5pIIcXCuvzfxd4NyQMyCB6J09eYyxEQmRRn6VCkDr03O1slpRqbHCPlIyRwKBdvmxYalO1raz4E9tGSm3UxAmRxG1dy3CZ1PyAbU4SS9IivPDkHm963q41wNxcrLeQZBZjm2U1CWTUT4oSmcP5L80YF7IZOkBMksn1nIuivaLk4IL2J2ZPhIHC1OYV5OqWgPdx7HssK"
      task_list = TodoList.new
      todo_task = Todo.new(string_257_chars)
      expect{task_list.add(todo_task)}.to raise_error "Task text must be less than 256 characters!"
    end

    it "passes when todo is 256 characters" do
      string_256_chars = "wFgXy6ZOdmUWA9cC97Wqk5zUrINAjXmZEAjgkimwPYOZkzHhvwY0n3khv5pIIcXCuvzfxd4NyQMyCB6J09eYyxEQmRRn6VCkDr03O1slpRqbHCPlIyRwKBdvmxYalO1raz4E9tGSm3UxAmRxG1dy3CZ1PyAbU4SS9IivPDkHm963q41wNxcrLeQZBZjm2U1CWTUT4oSmcP5L80YF7IZOkBMksn1nIuivaLk4IL2J2ZPhIHC1OYV5OqWgPdx7HssK"
      task_list = TodoList.new
      todo_task = Todo.new(string_256_chars)
      expect(task_list.add(todo_task)).to eq [todo_task]
    end
  end

  context "with some todo tasks added" do
    it "comes back in the list of complete todo tasks" do
      task_list = TodoList.new
      todo_task_1 = Todo.new("hoover the floors")
      todo_task_2 = Todo.new("dust the furniture")
      todo_task_3 = Todo.new("clean the kitchen")
      todo_task_4 = Todo.new("take out the bin bags")
      task_list.add(todo_task_1)
      todo_task_1.mark_done!
      task_list.add(todo_task_2)
      todo_task_2.mark_done!
      task_list.add(todo_task_3)
      task_list.add(todo_task_4)
      todo_task_4.mark_done!
      expect(task_list.complete).to eq [todo_task_1, todo_task_2, todo_task_4]
    end
  end

  context "all tasks are incomplete" do
    it "list includes all todo tasks" do 
      task_list = TodoList.new
      todo_task_1 = Todo.new("hoover the floors")
      todo_task_2 = Todo.new("dust the furniture")
      todo_task_3 = Todo.new("clean the kitchen")
      todo_task_4 = Todo.new("take out the bin bags")
      task_list.add(todo_task_1)
      task_list.add(todo_task_2)
      task_list.add(todo_task_3)
      task_list.add(todo_task_4)
      expect(task_list.incomplete).to eq [todo_task_1, todo_task_2, todo_task_3, todo_task_4]
    end
  end

  context "all tasks are complete" do
    it "lists is empty" do 
      task_list = TodoList.new
      todo_task_1 = Todo.new("hoover the floors")
      todo_task_2 = Todo.new("dust the furniture")
      todo_task_3 = Todo.new("clean the kitchen")
      todo_task_4 = Todo.new("take out the bin bags")
      task_list.add(todo_task_1)
      task_list.add(todo_task_2)
      task_list.add(todo_task_3)
      task_list.add(todo_task_4)
      expect(task_list.complete).to eq []
    end
  end

  context "give up" do
    it "marks all tasks as done" do 
      task_list = TodoList.new
      todo_task_1 = Todo.new("hoover the floors")
      todo_task_2 = Todo.new("dust the furniture")
      todo_task_3 = Todo.new("clean the kitchen")
      todo_task_4 = Todo.new("take out the bin bags")
      task_list.add(todo_task_1)
      task_list.add(todo_task_2)
      task_list.add(todo_task_3)
      task_list.add(todo_task_4)
      task_list.give_up!
      expect(task_list.complete).to eq [todo_task_1, todo_task_2, todo_task_3, todo_task_4]
      expect(task_list.incomplete).to eq []
    end
  end

end