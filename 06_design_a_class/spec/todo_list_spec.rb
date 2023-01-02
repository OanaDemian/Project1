require 'todo_list'

RSpec.describe TodoList do
  
  context "new todo task given" do
    todo = TodoList.new
    todo.add_task("hoover the floor")
    it "adds new task to list and returns list to user" do
      expect(todo.list).to eq ["hoover the floor"]  
    end
  end

  context "two new todo tasks given" do
    it "adds new tasks to list and returns list to user" do
      todo = TodoList.new
      todo.add_task("walk the dog")
      todo.add_task("take out the bin bags")
      expect(todo.list).to eq ["walk the dog", "take out the bin bags"]  
    end
  end
  
  context "when a task is completed" do
    todo = TodoList.new
      todo.add_task("walk the dog")
      todo.add_task("take out the bin bags")
    it " removes task from list and returns message #taskname task coplete! to user" do
      expect(todo.mark_complete("walk the dog")).to eq ("walk the dog task complete!")
      expect(todo.list).to eq ["take out the bin bags"]  
    end
  end

  context "when unwknown task is given" do
    todo = TodoList.new
      todo.add_task("walk the dog")
      todo.add_task("take out the bin bags")
      todo.mark_complete("walk the dog")
      it "fails" do
        expect{todo.mark_complete("hoover")}.to raise_error "Unknown task."
      end

    it "fails" do
      expect{todo.mark_complete("walk the dog")}.to raise_error "Unknown task."
    end
  end
end