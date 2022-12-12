def time_manager(text)
  fail "Incorrect input type: please enter text!" unless text.is_a? String
  fail "Please enter some text!" if text == ""
  fail "Please enter some text!" if text.match(/^\s+$/)
  raw_time = text.split(" ").count / 200.0
  raw_time.ceil 
end