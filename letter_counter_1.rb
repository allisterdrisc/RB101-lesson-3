# Letter Counter part 1
# Write a method that takes a string with one or more space separated words
# and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

# Examples
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

# START
# given a string of words
# SET word_size_count = an empty hash
# SET words = string of words separated at spaces into a list
# LOOP over words
  # SET size = the size of the word
  # IF word_size_count has a key that is size
    # increment the value for thay key by 1
  # ELSE
    # SET new key/value pair where size is key and value is 1
# return the word_size_count hash
# END


def word_sizes(string)
  word_size_count = {}
  words = string.split
  words.each do |word|
    size = word.size
    if word_size_count.keys.include?(size)
      word_size_count[size] += 1
    else
      word_size_count[size] = 1
    end
  end
  word_size_count
end

# launch school's solution: i tried to do this but kept getting nil and values
# weren't adding to the hash. when I initialized the hash like this: hash = {}, 
# hash[word.size] += 1 caused an exception to be raised because that element
# doesn't exist, so hash[word.size] returns nil, and nil cannot be added to 1.
# To fix this, launch school used the default value form of initializing counts:
counts = Hash.new(0)
# This forces any references to non-existing keys in counts to return 0.

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end
