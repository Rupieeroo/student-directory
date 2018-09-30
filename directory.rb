require 'CSV'

# First we out the students into an array
@students = []

# Method for looping through the interactive menu
def interactive_menu
  loop do
    print_menu
    menu_selection(STDIN.gets.chomp)
  end
end

# Method printing the menu options
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
  puts "9. Exit"
end

# Method outputting all the print methods for the students
# when called
def show_students
  print_header
  print_students_list
  group_by_cohort
  print_footer
end

# Method defining the user input for the interactive menu
def menu_selection(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_student_question
  when "9"
    exit # This causes the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

# Method for adding user input to the @students array
def aquire_students
  @students << {name: @name, cohort: @cohort, country: @country, age: @age}
end

# Method allowing the user to input the student data
# as requested
def input_students
  # gets the name
  @name =
  until @name == 'stop' do
  puts "Please enter the name of the student"
  puts "Enter 'stop' to finish student input"
  @name = STDIN.gets.strip
  if @name == 'stop'
    @students.count -1
    break
  end
  # gets the cohort
  puts "Please enter the cohort of the student"
  @cohort = STDIN.gets.strip
    if @cohort.empty?
      @cohort = :November
    end
  #while cohort is not empty, repeat this code
  # below code gets the country of origin
  puts "Please enter the country of origin of the student"
  @country = gets.strip
  # below code gets the age of student
  puts "Please enter the age of the student"
  @age = gets.strip
    # calls the aquire_students method
    aquire_students
    # the "" is to add a line space, making the output more readable
    puts ""
    puts "student added\n"
  end

  @students
end

# Method for saving the students to the students csv file
# (or potentially other files)
def save_students
  puts "where would you like to save the file?"
  input = gets.chomp
  if input == 'students.csv'
  # Open the file for writing
    file = CSV.open("students.csv", "w") do |file|

      # iterate over the array of students
      @students.each do |student|
        student_data = [
        student[:name],
        student[:cohort],
        student[:country],
        student[:age]
        ]
        file << student_data
        puts "students saved successfully\n"
      end
    end
  else
    puts "File not found"
    save_students
  end
end

# Method used to find out where the user
# wants to load the students from
def load_student_question
  puts "where would you like to load from?"
  input = gets.chomp
  if input == 'students.csv'
    load_students
  else
    puts "File not found"
    load_student_question
  end
end

# Method for loading from the students csv file
# (or potentially other files)
def load_students(filename = "students.csv")

  CSV.foreach("./students.csv") do |row|
    @name, @cohort, @country, @age = row
    aquire_students
  end

  puts "Students loaded successfully\n"
end

# Method for finding out if a user can load from that file
# also auto-loads the students.csv file in case of no input
def try_load_students
  filename = ARGV.first
  if filename.nil?
    puts "Loading students.csv by default"
    load_students
  elsif File.exists?(filename)
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else
    puts "File not found. Loading students.csv by default"
    load_students
  end
end

# The 'print' methods are here to print various aspects of the code
# when called upon
def print_header
  puts "The students of Villains Academy".center(40)
  puts "-------------".center(40)
end

def print_students_list
  count = 0
until count == @students.count
  @students.each.with_index(1) do |student, index|
     if student[:name][0] == "M" && student[:name].length <= 12
       puts " "
       puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(40)
       puts "From #{student[:country]} and #{student[:age]} years old".center(40)
       count +=1
     end
   end
 end
end

# This prints the students grouped by cohort
def group_by_cohort
  group_by_cohort = {}

  @students.each do |student|
    cohort = student[:cohort]
    name  = student[:name]

    if group_by_cohort[cohort] == nil
      group_by_cohort[cohort] = [name]
    else
      group_by_cohort[cohort].push(name)
    end
  end

  group_by_cohort.each do |cohort, students|
    puts ""
    puts "#{cohort} cohort: ".center(40)
    students.each.with_index(1) do |name, index|
      puts  "#{index}. #{name}".center(40)
    end
  end
end

def print_footer
  puts "-------------".center(40)
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student".center(40)
  else
    puts "Overall, we have #{@students.count} great students".center(40)
  end
end

# This collects and outputs the total number of students
def index_of_students(students)
  students.each_with_index do |value, index|
    puts "#{index}: #{value}"
  end
end

# calls the auto-load file
try_load_students
# calls the interactive menu
interactive_menu
