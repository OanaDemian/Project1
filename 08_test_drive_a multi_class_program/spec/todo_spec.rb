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