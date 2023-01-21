# Letter Swap
# Given a string of words separated by spaces, write a method that takes this string
# of words and returns a string in which the first and last letters of every word are swapped
# You may assume every word contains at least one letter, and that the string will always
# contain at least one word. You may also assume that each string contains just words and spaces

# Examples:
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

# START
# given a string of words separated by spaces
# separate the string into a list of words (separate at each space)
# LOOP over the list of words
  # for each word, swap the first and last characters with each other
  # save each word as its swapped version
# combine the list of words into a string with spaces between each word
# END

def swap(string)
  words = string.split(' ')
  swapped_words = words.map do |word|
    last_letter = word[-1]
    first_letter = word[0]
    word[0] = last_letter
    word[-1] = first_letter
    word
  end
  swapped_words.join(' ')
end

# launch school's solution: similar to mine but took logic out of the method and made it two methods
def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end