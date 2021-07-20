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

# print rewritten to use until rather than each
def print(students)
  index = 0
  until students.length == index
      puts " .#{index} #{students[index][:name]} (#{students[index][:cohort]} cohort)"
      index += 1
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
