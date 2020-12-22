

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
puts "The students of the Villain Academy"
puts "----------------------------------"
students.each do |student|
  puts student
end 
#Printed a total student count
puts "Overall, we have #{students.count} great students"
