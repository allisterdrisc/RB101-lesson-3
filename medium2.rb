# Practice Problems: Medium 2

# QUESTION 1
# Every object in Ruby has access to a method called object_id,
# which returns a numerical value that uniquely identifies the
# object. This method can be used to determine whether two
# variables are pointing to the same object.
# Take a look at the following code and predict the output:

a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# ANSWER:
# a and c will print the same object id number
# b will print a different object id number
puts a.object_id # 60
puts b.object_id # 80
puts c.object_id # 60
# When you run the code, the exact object ids may differ
# however, the output should make it clear that a and b reference
# different objects. Don't be deceived by appearances — the two objects
# look the same (both have the value "forty two") but they're different objects.
# Meanwhile, the object ids show that a and c reference the same object.
# This is because c was initialized to the object referenced by a

# (Object ids are a private implementation detail of how Ruby executes
# the code "under the hood", and may differ depending on your specific
# environment, Ruby version, etc. There's no guarantee that an object
# will have the same object id in two different runs of the program,
# so never rely on the specific value of the id).

# QUESTION 2
# Let's take a look at another example with a small difference in the code:
a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# ANSWER:
puts a.object_id # 85
puts b.object_id # 85
puts c.object_id # 85
# b wasn't explicitly initialized to the object referenced by a,
# but they have the same object id. What's going on?

# It turns out that this has to do with how integers are immutable;
# that is, the value of an integer object cannot be mutated.
# In Ruby, each integer is a single immutable object (there can only
# ever be one integer 1 object, one integer 2 object, and so on).
# As a result, a, b, and c all reference the same immutable integer
# 42 object. Any operation on an integer simply returns a new integer object.

# Note that for performance reasons, true, false and nil are also handled
# specially (every instance of true will all have the same object id)
# This also has to do with the immutability of true, false and nil.

# QUESTION 3
# Let's call a method, and pass both a string and an array
# as arguments and see how even though they are treated
# in the same way by Ruby, the results can be different.
# Study the following code and state what will be displayed...and why:
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# ANSWER:
# My string looks like this now: pumpkins
# My array looks like this now: ["pumpkins", "rutabaga"]

# In both cases, Ruby passes the arguments "by value",
# but unlike some other languages, the value that gets passed
# is a reference to some object. The string argument is passed
# to the method as a reference to an object of type String.
# Similarly, the array is passed to the method as a reference
# to an object of type Array

# The important distinction is that while a reference is passed,
# the method initializes a new local variable for both the string
# and the array and assigns each reference to the new local variables.
# These are variables that only live within the scope of the method definition

# So, if both arguments live inside the method as a new variable that
# stores a reference to the passed object...why don't the string and
# the array behave the same way in our output?

# The difference lies in what Ruby does when the program executes either
# a String#+= operation or an Array#<< operation.

# The String#+= operation is re-assignment and creates a new String object.
# The reference to this new object is assigned to a_string_param.
# The local variable a_string_param now points to "pumpkinsrutabaga",
# not "pumpkins". It has been re-assigned by the String#+= operation.
# This means that a_string_param and my_string no longer point to the same object

# With the array, one array object can have any number of elements.
# When we attach an additional element to an array using the << operator,
# Ruby simply keeps using the same object that was passed in,
# and appends the new element to it.

# So, because the local variable an_array_param still points to the
# original object, the local variables my_array and an_array_param
# are still pointing at the same object, and we see the results of
# what happened to the array "outside" of the method.

# QUESTION 4
# To drive that last one home...let's turn the tables and
# have the string show a modified output, while the array
# thwarts the method's efforts to modify the user's version of it.
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# ANSWER:
# My string looks like this now: pumpkinsrutabaga
# My array looks like this now: ["pumpkins"]

# We are still passing in the same two string and array arguments,
# but the results are the opposite, because our method does the "same thing"
# to each, but in a different way than before. That is, in both cases,
# the method attempts to change the string from "pumpkins" to "pumpkinsrutabaga"
# and add "rutabaga" to the array.

# Despite the similarity of the results inside the method definition,
# the results outside the method definition are the opposite.

# As before, the explanation is all about what Ruby does with a
# variable when we change the object it points to. Does it create
# a new object? Or is it able to just modify the existing object?
# In this case, our literal ['pumpkins', 'rutabaga'] array is a new
# object, and we are assigning it to the local variable an_array_param

# QUESTION 5
# Depending on a method to modify its arguments can be tricky:
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Whether the above "coincidentally" does what we think we
# wanted depends upon what is going on inside the method.

# How can we change this code to make the result easier to
# predict and easier for the next programmer to maintain?
# That is, the resulting method should not mutate either argument,
# but my_string should be set to 'pumpkinsrutabaga' and my_array
# should be set to ['pumpkins', 'rutabaga']

# ANSWER:
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# QUESTION 6
# How could the following method be simplified
# without changing its return value?
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# ANSWER:
# Ruby will automatically evaluate statements
def color_valid(color)
  color == "blue" || color == "green"
end
