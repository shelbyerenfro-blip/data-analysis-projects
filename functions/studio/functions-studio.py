# We want to COMPLETELY reverse a list by flipping the order of the entries AND flipping the order of characters in each element.

# a) Define a 'reverse_characters' function. Give it one parameter, which will be the string to reverse.
def reverse_characters(word):
# b) Within the function, use the 'list' function to split a string into a list of individual characters
    word_list = list(word)
# c) 'reverse' your new list.
    word_list.reverse()
# d) Use 'join' to create the reversed string and return that string from the function.
    reverse_word = ''.join(word_list)
    return reverse_word
# e) Create a variable of type string to test your new function. 
test_string = 'Shelbye'
# f) Use 'print(reverse_characters(my_variable_name))'; to call the function and verify that it correctly reverses the characters in the string.
print(reverse_characters(test_string))
# g) Use method chaining to reduce the lines of code within the function.
def reverse_characters(word):
    return ''.join(list(word)[::-1])
print(reverse_characters(test_string))


# 2) The 'split' method does not work on numbers, but we want the function to return a number with all the digits reversed (e.g. 1234 converts to 4321 and NOT the string "4321")
# a) Add an if statement to your reverse_characters function to check the typeof the parameter.
def reverse_characters(word):
    if type(word) is str:
        return ''.join(list(word)[::-1])
# b - d) If type is ‘string’, return the reversed string as before. If type is ‘number’, convert the parameter to a string, reverse the characters, then convert it back into a number. Return the reversed number.
    if type(word) is int:
        new_string = str(word)
        reverse_nums = ''.join(list(new_string)[::-1])
        return int(reverse_nums) 

# e) Be sure to print the result returned by the function to verify that your code works for both strings and numbers. Do this before moving on to the next steps.
input_num = 1234
input_string = 'Shelbye'
print(reverse_characters(input_num))
print(reverse_characters(input_string))  

# 3) Create a new function with one parameter, which is the list we want to change. The function should:
def new_function(list):
# a) Define and initialize an empty list.
    new_list = []
# b) Loop through the old list.
    for i in list:
# c) For each element in the old list, call reverse_characters to flip the characters or digits.
        new_item = reverse_characters(i)
# d) Add the reversed string (or number) to the list defined in part ‘a’.
        new_list.append(new_item)
# e) Return the final, reversed list.
    return new_list[::-1]
# f) Be sure to print the results from each test case in order to verify your code.
list_test1 = ['apple', 'potato', 'Capitalized Words']
list_test2 = [123, 8897, 42, 1168, 8675309]
list_test3 = ['hello', 'world', 123, 'orange']

print(new_function(list_test1))
print(new_function(list_test2))
print(new_function(list_test3))