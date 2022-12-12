def count_words(text)
    fail "Incorrect input type: please enter text!" unless text.is_a? String
    fail "Please enter some text!" if text == "" || text.match(/^\s+$/)
    text.split(" ").length
end