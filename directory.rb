# get user input
def input_students
  puts "please enter the name of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get student name
  name = gets.chomp
  # while the name is not empty, repeat the following
  while !name.empty? do
    # add student hash to array
    students <<  {name: name, cohort: :november}
    # get another name from user
    name = gets.chomp
  end
  # return the array of students
  students
end
  

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end 
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#here we call the methods
students = input_students
print_header
print(students)
print_footer(students)
