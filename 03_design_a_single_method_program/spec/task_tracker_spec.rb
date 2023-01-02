require 'task_tracker'

RSpec.describe "TODO: take out the garbage" do
  context "when user's text includes a to do list correctly spelt #TODO" do
    it "returns true" do
      result = task_tracker("#TODO: take out the garbage")
      expect(result).to eq true
    end
  end

   context "when incorrectly spelt to do list" do
    it "returns false" do
      result = task_tracker("TODO: take out the garbage")
      expect(result).to eq false
    end
  end

   context "when given to do list with wrong caps" do
    it "returns false" do
      result = task_tracker("#todo: take out the garbage")
      expect(result).to eq false
    end
  end

   context "when no text given" do
    it "returns false" do
      result = task_tracker("")
      expect(result).to eq false
    end
  end

   context "when text given is only blank spaces" do
    it "returns false" do
      result = task_tracker("     ")
      expect(result).to eq false
    end
  end

   context "when given wrong type of argument, e.g. integer" do
    it "fails" do
      # result = task_tracker()
      expect{task_tracker(12345)}.to raise_error "ERROR: given wrong type of argument. Add task in text format!"
    end
  end

  context "when given only #TODO without text" do
    it "fails" do
      # result = task_tracker()
      expect{task_tracker("#TODO")}.to raise_error "ERROR: you forgot to describe the task. Add text to describe task!"
    end
  end
end