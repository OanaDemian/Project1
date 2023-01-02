def get_most_common_letter(text)
  counter = Hash.new(0)
  #Hash.new(0) sets default value for any key to 0, while {} sets nil
  # p text.chars
  text.chars.each do |char|
  #adds each character to Hash as a key, and the value 
  #passed in is the count of how may times the character appears in the string
   counter[char] += 1
  end
  #returns an array of the key value pairs sorted by the most common letter
    counter.to_a.select{|elem|("a".."z").include?(elem[0])}.sort_by { |k, v| v }[-1][0]
end
p get_most_common_letter("the roof, the roof, the roof is on fire!")
# Intended output:
# 
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"
