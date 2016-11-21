# Question 1
# What would you expect the code below to print out?

# numbers = [1, 2, 2, 3]
# numbers.uniq
# puts numbers

# Answer 1
# Because puts outputs a string , and because calling .uniq returns a new array 
# but doesn't mutate the original array the output will be:

# 1
# 2
# 2
# 3




# Question 2

# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

# ! and ? after a method are actually naming conventions , and not to be considered Ruby syntax. In abstract ! seems to
# deal with with caution of extreme change , while ? deals with inquiry and choice. 

# what is != and where should you use it? ( this is translated as 'not equals' , and seems to output a boolean 
# i.e. (1 != 2) outputs true , while ('bob' != 'bob') outputs false ).

# put ! before something, like !user_name ( it becomes its opposite boolean equivalent 
# based on the truthiness of the expression i.e. !1 outputs false , !nil outputs true )

# put ! after something, like words.uniq! ( if you call a method with ! it will mutate the caller, otherwise error )

# put ? before something 

# put ? after something ( if you call a method with ? it will apply a boolean logic to the caller based upon what object
# it was given and the logical parameters )

# put !! before something, like !!user_name ( its becomes its boolean equivalent i.e. !!1 outputs true , !!nil outputs false )

# Question 3

# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub('important' , 'urgent')

# Question 4

# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]
#What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1) ( removes the element located at given index point )
numbers.delete(1) ( removes given element from the caller )

# Question 5

# Programmatically determine if 42 lies between 10 and 100.

(10..100).include?(42)

# hint: Use Ruby's range object in your solution.

# Question 6

# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

"Four score and " + famous_words
"Four score and " << famous_words


# Question 7

# Fun with gsub:

# def add_eight(number)
#   number + 8
# end

# number = 2

# how_deep = "number"
# 5.times { how_deep.gsub!("number", "add_eight(number)") }

# p how_deep
# This gives us a string that looks like a "recursive" method call:
# "add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"

# If we take advantage of Ruby's Kernel#eval method to have it execute this string as if it were a "recursive" method call

# eval(how_deep)
# what will be the result?
42

# Question 8

# If we build an array like this:

# flintstones = ["Fred", "Wilma"]
# flintstones << ["Barney", "Betty"]
# flintstones << ["BamBam", "Pebbles"]
# We will end up with this "nested" array:

 flint = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
# Make this into an un-nested array.
 flint.flatten!

# Question 9

# Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# Turn this into an array containing only two elements: Barney's name and Barney's number
flinstones.assoc('Barney')

# Question 10

# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values are the positions in the array.

flintstones_hash = {}
flintstones.each_with_index {|name, index| flintstones_hash[name] = index}
flinstones_hash


