proto_list1 = "3,6,9,12"
proto_list2 = "A;C;M;E"
proto_list3 = "space delimited string"
proto_list4 = "Comma-spaces, might, require, typing, caution"

strings = [proto_list1, proto_list2, proto_list3, proto_list4]

# a) Use the 'in' method to check to see if the words in each string are separated by commas (,), semicolons (;) or just spaces.

connectors = [', ', ',', ';', ' ']

for string in strings:
    for connector in connectors:
        if connector in string:
            if connector == ' ':
                print(f"The string '{string}' is separated by spaces")
            elif connector == ';':
                print(f"The string '{string}' is separated by semicolons")
            else:
                print(f"The string'{string}' is separated by commas")
            break

# b) If the string uses commas to separate the words, split it into an array, reverse the entries, and then join the array into a new comma separated string.
for string in strings:
 if ',' in string and ' ' not in string:
    array = string.split(',')
    array.reverse()
    new_string = ','.join(array)
    print(new_string)

# c) If the string uses semicolons to separate the words, split it into an array, alphabetize the entries, and then join the array into a new comma separated string.
for string in strings:
 if ';' in string:
    array = string.split(';')
    array.sort()
    new_string = ';'.join(array)
    print(new_string)

# d) If the string uses spaces to separate the words, split it into an array, reverse alphabetize the entries, and then join the array into a new space separated string.
for string in strings:
 if ' ' in string and ',' not in string:
    array = string.split()
    array.sort()
    array.reverse()
    new_string = ' '.join(array)
    print(new_string)

# e) If the string uses ‘comma spaces’ to separate the list, modify your code to produce the same result as part “b”, making sure that the extra spaces are NOT part of the final string.
for string in strings:
 if ',' in string and ' ' in string:
    array = string.split(', ')
    array.reverse()
    new_string = ','.join(array)
    print(new_string)
