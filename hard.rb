# Question 1

# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting

# Calling greeting will return nil , because when you initalize a variable within an if block , it will 
# also be available outside the block ( even if the if block is never executes ). Because greeting = "hello world" only under
# the condition of the block , greeting is initialized and set to value nil instead.


# Question 2

What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# greetings = { :a 'hi there' } becuase informal_greeting is pointing to the original object 'hi'. Therefore when we change
# informal_greeting with << 'there' , it also affects the value of greetings.

# Question 3

# In other exercises we have looked at how the scope of variables affects the modification of one "layer" 
# when they are passed to another.

# To drive home the salient aspects of variable scope and modification of one scope by another, consider the 
# following similar sets of code.

# What will be printed by each of these code groups?

# A)

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # one
puts "two is: #{two}" # two
puts "three is: #{three}" # three

# B)

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # one
puts "two is: #{two}" # two
puts "three is: #{three}" # three
C)

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # two
puts "two is: #{two}" # three
puts "three is: #{three}" # one

# The reason A) and B) are unchanged is because those reassignments only live within the scope of the method , therefore
# our local variables remain unchanged. However in C) when we use gsub! ( because of bang ) it changes the values of
# our local variables.


# Question 4

# A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the 
# same system. That is, without any form of synchronization, two or more separate computer systems can create new items 
# and label them with a UUID with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and 
# represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

def generate_UUID
  characters = %w(a b c d e f 0 1 2 3 4 5 6 7 8 9)
  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index == 4 
  end
  uuid
end

# Question 5

# Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing 
# dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben 
# with a method called is_an_ip_number? that determines if a string is a valid ip address number and asked Ben to use it.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition,
# and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" 
# should be invalid)."

# Help Ben fix his code.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4 # check to make sure there are four sections
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word) # change break to return false here because we want to continue using our while loop
  end
  true # no need for return here
end
