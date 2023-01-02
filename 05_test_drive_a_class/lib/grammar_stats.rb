class GrammarStats
  def initialize
    # ...
    @checks = []
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
     result = text[0] == text[0].upcase && ".?!".include?(text[-1]) 
     @checks.push(result)
     return result
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
   @checks.count(true) * 100 / @checks.length
  end
end