# Clean Up The Words
# Given a string that consists of some words (all lowercased) and an assortment
# of non-alphabetic characters, write a method that returns that string with all
# of the non-alphabetic characters replaced by spaces. If one of more non-alphabtic
# characters occur in a row, you should only have one space in the result (no consecutive spaces)

# Example:
cleanup("---what's my +*& line?") == ' what s my line '

# START
# given a string containing words and non-alphabetic characters
# LOOP over the string
  # replace each non-alphabetic character with a space
  # if there's multiple spaces replace with a single space
# return the new string
# END

# Or

# make 2 methods:
# one for deleting multiple spaces in a row
# one for replacing non-alphabetic characters with spaces


# START (remove consecutive spaces method)
# given a string
# LOOP over the string
# search the string for two or more spaces in a row
# replace multiple spaces in a row with single space
# return string
# END

# START (replacing non-alphabetic characters method)
# given a string
# replace all non-alphabetic characters with a space
# call remove consecutive spaces method with string_with_spaces as the argument
# END

def remove_consecutive_spaces(string)
  string.squeeze(' ')
end

def clean_up_words(string)
  string.gsub!(/[^a-z]/, ' ')
  remove_consecutive_spaces(string)
end

# launch school's solution:
ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_chars = []

  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end

  clean_chars.join
end

# Or (this one similar to mine but one concise method)
def cleanup(text)
  text.gsub(/[^a-z]/, ' ').squeeze(' ')
end

