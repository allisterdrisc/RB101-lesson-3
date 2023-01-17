# Practice Problems Easy 1

# Question 1: What do you expect will output?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# answer:
# 1
# 2
# 2
# 4

# Question 2: Describe the difference between ! and ? in Ruby.
    # if you see ! or ? at the end of a method, it's part
    # of the method name, and not Ruby syntax
    # you won't know what the method will do based on 
    # those characters, it depends on the method implementation
    # but there are also uses for ! and ? separate from
    # being a part of some method names, which are 
    # actually Ruby syntax
  # Explain what will happen in the following scenarios:
  # 1. what is != and where should you use it?
      # != means "not equals". it should be used when 
      # you want to compare values to either side of it to 
      # check that they aren't equal to each other
      # it returns true if the values aren't equal, false if they are

  # 2. put ! before something, like !user_name
      # ! on its own is the not operator
      # it will take the value assigned to user_name 
      # and make its truthiness/falsiness value the opposite
      # aka turn any object into the opposite 
      # of their boolean equivalent

  # 3. put ! after something, like words.uniq!
      # after a method name, ! usually means the
      # method will be destructive and mutate the
      # caller or arguments, but not always
      # always check if you don't know 

  # 4. put ? before something
      # if used in a ternary, it separates the
      # boolean expression from the two outcomes

  # 5. put ? after something
      # may be at the end of some method names
      # you have to check with specific methods
      # to know how they function

  # 6. put !! before something, like !!user_name
      # putting !! before user_name will make it
      # the oppositive truthiness/falsiness value
      # and then the oppositve of that
      # aka..turn any object into their boolean equivalent

# Question 3: Replace the word "important" with "urgent" in this string:
advice = "Few things in life are as important as house training your pet dinosaur."

# answer:
advice.gsub!('important', 'urgent')

# Question 4: The Ruby Array class has several methods for removing items from the array
# Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]
# What do the following method calls do 
# (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)
# answer:
numbers = [1, 3, 4, 5]

numbers.delete(1)
# answer:
numbers = [2, 3, 4, 5]

# Question 5: Programmatically determine if 42 lies between 10 and 100
# hint: Use Ruby's range object in your solution

# answer:
10..100.cover?(42)

# Question 6: Starting with the string:
famous_words = "seven years ago..."
# show two different ways to put the expected "Four score and " in front of it

# answer:
"Four score and " + famous_words
"Four score and " << famous_words

# If we build an array like this:
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
# We will end up with this "nested" array:
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
# Make this into an un-nested array

# answer
flintstones.flatten!

# Question 8: Given the hash below
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# Turn this into an array containing only two elements: Barney's name and Barney's number

# answer:
flintstones.assoc("Barney")






