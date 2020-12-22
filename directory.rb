

#lets put all the students into an array
students = ["Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krugger",
  "The Joker",
  "Joeffrey Baratheon",
  "Norman Bates"
 ]

# and then print them
def print_header
  puts "The students of the Villain Academy"
  puts "----------------------------------"
end
def print(names)
  names.each do |name|
    puts name
  end
end
#Printed a total student count
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
print_header
print(students)
print_footer(students)
