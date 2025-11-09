food = "water bottles,meal packs,snacks,chocolate"
equipment = "space suits,jet packs,tool belts,thermal detonators"
pets = "parrots,cats,moose,alien eggs"
sleep_aids = "blankets,pillows,eyepatches,alarm clocks"

# a) Use split to convert the strings into four cabinet lists. Alphabetize the contents of each cabinet.
strings = [food, equipment, pets, sleep_aids]

for string in strings:
    cabinet = string.split(',')
    cabinet.sort()
    print(cabinet)

# b) Initialize a cargo_hold list and add the cabinet lists to it. Print cargo_hold to verify its structure.
cargo_hold = []

for string in strings:
    cabinet = string.split(',')
    cabinet.sort()
    cargo_hold.append(cabinet)
print(f"Cargo_hold contains {cargo_hold}")
    
# c) Query the user to select a cabinet (0 - 3) in the cargo_hold.
c = input("Please select a cabinet (0-3)")

# d) Use bracket notation and format to display the contents of the selected cabinet. If the user entered an invalid number, print an error message.
c = int(c)
if c >= 0 and c < 4:
    print(cargo_hold[c])
else:
    print(f"Error: Invalid Number")

# e) Modify the code to query the user for BOTH a cabinet in cargo_hold AND a particular item. Use the in method to check if the cabinet contains the selected item, then print “Cabinet ____ DOES/DOES NOT contain ____.”
c = input("Please select a cabinet (0-3): ")
c = int(c)
if c >= 0 and c < 4:
    i = input("Please enter an item to search for: ")
    if i in cargo_hold[c]:
        print(f"Cabinet{c} DOES contain {i}")
    else:
        print(f"Cabinet {c} DOES NOT contain {i}")
else:
    print(f"Error: Invalid Number")