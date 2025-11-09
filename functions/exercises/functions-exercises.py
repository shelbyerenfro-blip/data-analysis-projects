# Part 1 A -- Make a Line

def make_line(size):
    hash_line = ''
    for i in range(size):
        hash_line += '#'
    return hash_line
'''
print(make_line(5))
'''
# Part 1 B -- Make a Square
# create a function using your make_line function to code a square
def make_square(size):
    square = ''
    for i in range(size):
        square += (make_line(size) +"\n")
    return square
'''      
print(make_square(5))
'''
# Part 1 C -- Make a Rectangle
def make_rectangle(width, height):
    rectangle = ''
    for i in range(height):
        rectangle += (make_line(width) + "\n") 
    return rectangle
'''
print(make_rectangle(5,3))
'''

# Part 2 A -- Make a Stairs
def make_downward_stairs(height):
    triangle = ''
    for i in range(height):
        triangle += (make_line(i+1) + "\n")
    return triangle
'''
print(make_downward_stairs(5))
'''
# Part 2 B -- Make Space-Line 
def make_space_line(numSpaces, numChars):
    space = ''
    char = ''
    for i in range(numSpaces):
        space += ' '
    for i in range(numChars):
        char += '#'
    return space + char + space
'''
print(make_space_line(3,5))
'''
# Part 2 C -- Make Isosceles Triangle
def make_isosceles_triangle(height):
    isosceles_triangle = ''
    for i in range(height):
        isosceles_triangle += (make_space_line((height - i - 1), (2 * i + 1)) + "\n")
    return isosceles_triangle
'''
print(make_isosceles_triangle(5))
'''
# Part 3 -- Make a Diamond
def make_diamond(height):
    top_diamond = make_isosceles_triangle(height)
    bottom_diamond = ''
    for i in range(height - 1, -1, -1):
        bottom_diamond += (make_space_line((height - i - 1), (2 * i + 1)) + "\n")
    return top_diamond + bottom_diamond

print(make_diamond(5))
