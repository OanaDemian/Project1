def task_tracker(text)
  fail "ERROR: given wrong type of argument. Add task in text format!" unless text.is_a?(String)
  fail "ERROR: you forgot to describe the task. Add text to describe task!" if text == "#TODO"
  text.include?("#TODO")
end