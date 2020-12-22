def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty arraty
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return array of students
  students
end
# and then print them
def print_header
  puts "The students of the Villain Academy"
  puts "----------------------------------"
end
def print(names)
  names.each do |name|
    puts "#{name[:name]} (#{name[:cohort]} cohort)"
  end
end
#Printed a total student count
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
