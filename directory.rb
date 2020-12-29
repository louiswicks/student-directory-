# 8.6
@width = 50

# 8.7
@students = []

# 8.5
def create_new_student
  puts "Do you want to create a new student? (y/n)".center(@width)
  continue = STDIN.gets.chomp.downcase
  if continue == "y"
    return true
  elsif continue == "n"
    return false
  else
    puts "Invalid choice - please enter y or n".center(@width)
  end
  create_new_student
end

def input_students
  continue = create_new_student
  while continue
    puts "Please enter the name of the student".center(@width)
    name = STDIN.gets.chomp
    puts "Please enter the cohort".center(@width)
    cohort = STDIN.gets.chomp
    puts "Please enter the country of birth".center(@width)
    country_of_birth = gets.chomp
    hobbies = add_hobbies
    adding_students(name, cohort, country_of_birth, hobbies)
    puts "Now we have #{@students.count} students".center(@width)
    continue = create_new_student
  end
  @students
end

def add_hobbies
  hobbies = []
  puts "Please enter student's hobbies".center(@width)
  puts "(To finish, just hit return twice)".center(@width)
  hobby = STDIN.gets.chomp
  while !hobby.empty?
    hobbies << hobby
    hobby = STDIN.gets.chomp
  end
  hobbies
end

def print_header
  if !@students.empty?
    puts "The students of Villains Academy".center(@width)
    puts "-------------".center(@width)
  else
  end
end

# 8.12
def print_students_list(students)
  if students.empty?
    puts "No students available".center(@width)
  else
    i = 0
    while i < @students.count
      puts "#{i + 1}. #{@students[i][:name]}, #{@students[i][:country_of_birth]} (#{@students[i][:cohort]})".center(@width)
      i += 1
    end
  end
end

# 8.2
def print_by_first_letter(students)
  if @students.empty?
    puts "No students available".center(@width)
  else
    puts "Student names beginning with: (Please enter a letter)".center(@width)
    letter = gets.chomp
    number_of_matches = 0
    @students.each do |student|
      if student[:name].start_with?(letter.upcase, letter.downcase)
        puts "#{student[:name]}, #{student[:country_of_birth]} (#{student[:cohort]} cohort)".center(@width)
        number_of_matches += 1
      else
      end
    end
    puts
    puts "We have #{number_of_matches} students whose name begins with #{letter}".center(@width)
    puts
  end
end

# 8.3
def print_by_name_length(students)
  if @students.empty?
    puts "No students available".center(@width)
  else
    puts "Names with maximum characters of: (Please enter a number)".center(@width)
    max_length = gets.chomp
    number_of_matches = 0
    @students.each do |student|
      if student[:name].length <= max_length.to_i
        puts "#{student[:name]}, #{student[:country_of_birth]} (#{student[:cohort]} cohort)".center(@width)
        number_of_matches += 1
      else
      end
    end
    puts
    puts "We have #{number_of_matches} students with a name of maximum #{max_length} characters".center(@width)
    puts
  end
end


def print_footer(students)
  if !@students.empty?
    puts "Overall, we have #{@students.count} great students".center(@width)
  else
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to the students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_student
  print_header
  print_students_list(@students)
  print_footer(@students)
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_student
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean. Try again."
  end
end

#saving files to our directory

def save_students
  #open the file or writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

#creating the interactive menu

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  adding_students(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't exist."
    exit
  end
end

def adding_students(name, cohort)
  @students << { name: name, cohort: cohort.to_sym}
end


#call the methods
try_load_students
interactive_menu
