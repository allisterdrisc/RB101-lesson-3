# Letter Counter part 2
# Modify the word_sizes method from the previous exercise
# to exclude non-letters when determining word size.
# For instance, the length of "it's" is 3, not 4.

# Examples:
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}

# original method definition:
def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end

# START
# given an string of words
# SET counts = new empty hash (using the default value form so values default to 0)
# LOOP over string of words
  # SET just_lettters = word with non letters deleted
  # SET counts key = just_letters size
  # increment counts value by 1
# return counts
# END

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    just_letters = word.delete('^a-zA-Z')
    counts[just_letters.size] += 1
  end
  counts
end

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}
