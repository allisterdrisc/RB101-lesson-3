# ASCII String Value
# write a method that determines and returns the ASCII string value
# of a string that is passed in as an argument. The ASCII string value
# is the sum of the ASCII values of every character in the string
# You may use String#ord to determine the ASCII value of a character

# START
# given a string
# SET characters = the string separated into a list of its characters
# SET ascii total = 0
# LOOP over characters 
  # find the ASCII value for each character
  # add each ASCII value to ascii total
# return ascii total
# END

def ascii_value(string)
  characters = string.chars
  ascii_total = 0
  characters.each { |char| ascii_total += char.ord }
  ascii_total
end

# launch school's solution: used each_char instead of char and then each
def ascii_value(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end