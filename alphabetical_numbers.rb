# Alphabetical Numbers
# Write a method that takes an Array of Integers between 0 and 19,
# and returns an Array of those Integers sorted based on the
# English words for each number: 
# zero, one, two, three, four, five, six, seven, eight, nine,
# ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen,
# seventeen, eighteen, nineteen

# Example:
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# START
# SET constant var numbers_as_words = an array with english words for zero-nineteen
# given an array of integers between 0-19
# SET word_array = result of below loop
  # LOOP over the array of integers
    # use numbers_as_words array to change each integer to its word form
# LOOP over word_array
  # organize elements from a-z so word_array is permanently changed
# SET ordered_number_array = to the results of the loop below
  # LOOP over word_array
    # use numbers_as_words array to change each word to its integer form (index)
# return ordered_number_array
# END

NUMBERS_AS_WORDS = [ 
  'zero', 'one', 'two', 'three',
  'four', 'five', 'six', 'seven', 'eight', 'nine',
  'ten', 'eleven', 'twelve', 'thirteen', 'fourteen',
  'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'
]

def alphabetic_number_sort(numbers_array)
  word_array = numbers_array.map { |num| NUMBERS_AS_WORDS[num] }
  word_array.sort!
  ordered_number_array = word_array.map do |word|
    word = NUMBERS_AS_WORDS.index(word)
  end
  ordered_number_array
end

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# launch school's solution: also uses a constant variable array, but uses sort_by instead of sort, much more concise 
NUMBER_WORDS = %w(zero one two three four
  five six seven eight nine
  ten eleven twelve thirteen fourteen
  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
numbers.sort_by { |number| NUMBER_WORDS[number] }
end