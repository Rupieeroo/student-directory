#first we out the students into an array
def input_students
  #create an empty array
  students = []
  #get the name
  name =
  until name == 'stop' do
  puts "Please enter the name of the student"
  puts "Enter 'stop' to finish student input"
  name = gets.strip
  if name == 'stop'
    students.count -1
    break
  end
  #while the name is not empty, repeat this code
  puts "Please enter the cohort of the student"
  cohort = gets.strip
    if cohort.empty?
      cohort = :November
    end
  #while cohort is not empty, repeat this code
  puts "Please enter the country of origin of the student"
  country = gets.strip
  #while country is not empty, repeat this code
  puts "Please enter the age of the student"
  age = gets.strip
  #while age is not empty, repeat this code
    #add the student has to the array
    students << {name: name, cohort: cohort, country: country, age: age}
  end

  students
end

#next, we print them
def print_header
  puts "The students of Villains Academy".center(40)
  puts "-------------".center(40)
end

def print_m(students)
  count = 0
until count == students.count
  students.each.with_index(1) do |student, index|
     if student[:name][0] == "M" && student[:name].length <= 12
       puts " "
       puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(40)
       puts "From #{student[:country]} and #{student[:age]} years old".center(40)
       count +=1
     end
   end
 end
end

def group_by_cohort(students)
  group_by_cohort = {}

  students.each do |student|
    cohort = student[:cohort]
    name  = student[:name]

    if group_by_cohort[cohort] == nil
      group_by_cohort[cohort] = [name]
    else
      group_by_cohort[cohort].push(name)
    end
  end

  group_by_cohort.each do |cohort, students|
    puts " "
    puts "#{cohort.to_s} cohort: ".center(40)
    students.each.with_index(1) do |name, index|
      puts  "#{index}. #{name}".center(40)
    end
  end
end

def print_footer(names)
  puts "-------------".center(40)
  if names.count == 1
    puts "Overall, we have #{names.count} great student".center(40)
  else
    puts "Overall, we have #{names.count} great students".center(40)
  end
end

def index_of_students(students)
  students.each_with_index do |value, index|
    puts "#{index}: #{value}"
  end
end
#finally we print the total number of students
students = input_students
print_header
print_m(students)
group_by_cohort(students)
print_footer(students)
