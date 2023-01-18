# Practice Problems: Medium 1

# QUESTION 1
# Let's do some "ASCII Art" (a stone-age form of nerd artwork from back
# in the days before computers had video screens).
# For this practice problem, write a one-line program that creates the
# following output 10 times, with the subsequent line indented 1 space to the right:

The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!

# ANSWER:
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# QUESTION 2
# The result of the following statement will be an error:
puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?

# ANSWER:
# Ruby can't add a string and integers together with concatenation
# TypeError: no implicit conversion of Integer into String
# Fix by using string interpolation or the method to_s
puts "the value of 40 + 2 is #{40 + 2}"
puts "the value of 40 + 2 is " + (40 + 2).to_s

# QUESTION 3
# Alan wrote the following method, which was intended to show
# all of the factors of the input number:
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
# Alyssa noticed that this will fail if the input is 0, or a
# negative number, and asked Alan to change the loop.
# How can you make this work without using the begin/end until
# construct? Note that we're not looking to find the factors for 0
# or negative numbers, but we just want to handle it gracefully instead
# of raising an exception or going into an infinite loop.
# Bonus 1
# What is the purpose of the number % divisor == 0 ?
# Bonus 2
# What is the purpose of the second-to-last line (line 8)
# in the method (the factors before the method's end)?

# ANSWER:
# use a while loop instead
def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end
# Bonus 1 ANSWER:
# The purpose is to check if the divisor goes into number
# with 0 remainders, if it does then it returns true and means
# that that number/divisor is a factor of the number
# Bonus 2 ANSWER:
# The purpose is to return the array of numbers that is assigned
# to the factors variable. Methods return the last line of code
# unless an implicit return is used earlier.
# If factors wasn't the last line, the method would return nil

# QUESTION 4
# Alyssa was asked to write an implementation of a rolling buffer.
# Elements are added to the rolling buffer and if the buffer becomes full,
# then new elements that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying,
# "Take your pick. Do you like << or + for modifying the buffer?".
# Is there a difference between the two, other than what operator
# she chose to use to concatenate an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# ANSWER:
# Both methods have the same return value. However, the first implementation
# returns a reference to the object passed in as the buffer argument,
# while the second returns a new object. Furthermore, the first implementation
# mutates the argument given by the buffer argument, while the second does not
# mutate its input_array argument. That is, the code that calls rolling_buffer1
# will see a modified array after the method returns, while the code that calls
# rolling_buffer2 will not see any changes in the array.

# It's also worth nothing that Alyssa's first solution both returns a meaning value
# and has a side effect. As we learned earlier, that's something we should avoid.
# Thus, the second solution is probably the better of the two.

# QUESTION 5
# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator.
# A user passes in two numbers, and the calculator will keep computing the sequence
# until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it,
#  he got an error. Something about the limit variable. What's wrong with the code?
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
# How would you fix this so that it works?

# ANSWER:
# the limit variable is outside of the method and wasn't passed
# in as an argument so the method can't access it.
# add in a third parameter and pass in limit as the argument

# QUESTION 6
# What is the output of the following code?
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# ANSWER:
34

# QUESTION 7
# One day Spot was playing with the Munster family's home computer
# and he wrote a small program to mess with their demographic data:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
# After writing this method, he typed the following...
# and before Grandpa could stop him, he hit the Enter key with his tail:
mess_with_demographics(munsters)
# Did the family's data get ransacked? Why or why not?

# ANSWER:
# Remember that in Ruby, what gets passed to a method isn't the value
# of the object. Under the hood, Ruby passes the object_id of each
# argument to the method. The method stores these object_id's internally
# in locally scoped (private to the method) variables 
# (named per the method definition's parameter list).
# So Spot's demo_hash is pointing to the munsters hash. In this case,
# the program does not create a new hash for the result -- it just uses
# the existing hash as-is. So the actual hash object that is being
# messed with inside of the method IS the munsters hash.

# QUESTION 8
# Method calls can take expressions as arguments.
# Suppose we define a method called rps as follows,
# which follows the classic rules of rock-paper-scissors game:
# it returns the winning fist or, in the case of a tie, the fist that both players played.
  def rps(fist1, fist2)
    if fist1 == "rock"
      (fist2 == "paper") ? "paper" : "rock"
    elsif fist1 == "paper"
      (fist2 == "scissors") ? "scissors" : "paper"
    else
      (fist2 == "rock") ? "rock" : "scissors"
    end
  end
  # What is the result of the following call?
  puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# ANSWER:
"paper"
# my work to find that:
full thing = rps(rps(rps("rock", "paper")rps("rock", "scissors")), "rock")
broken down = rps(long thing, "rock")
  long thing = rps(rps("rock", "paper")rps("rock", "scissors"))
    evaluates to = rps("paper", "rock")
      evaluates to = "paper"
evaluated long thing = rps("paper", "rock")
  evaluated full thing = "paper"

# QUESTION 9
# Consider these two simple methods:
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
# What would be the return value of the following method invocation?
bar(foo)

# ANSWER:
# return value: "no"
# because:
foo #=> always returns "yes"
bar(foo) #=> the ternary expression will be false and return "no"
