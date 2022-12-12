def check_grammar?(text)
    capital_check = text[0] == text[0].upcase
    punctuation_check = text[-1].match?(/[!?.]/)
    # punctuation_check = '.?!'.include?(text[-1])
    capital_check && punctuation_check
end