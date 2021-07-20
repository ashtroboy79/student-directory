# get user input
def input_students
  puts "please enter the name of the students followed by the cohort"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get student name
  # print "Name: "
  name, cohort = gets.split.map(&:to_sym)
  # while the name is not empty, repeat the following
  while !name.to_s.empty? do
    # if cohort is empty set to default
    if cohort.to_s.empty?
      cohort = :defualt
    end
    # add student hash to array
    students <<  {name: name, cohort: cohort, hobbies: "Taking over the world"}
    # get another name from user
    name, cohort = gets.split.map(&:to_sym)
  end
  # return the array of students
  students
end
  

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

# print 
def print(students)
  index = 0
  until students.length == index
      puts " .#{index} #{students[index][:name]} (#{students[index][:cohort]} cohort) #{students[index][:hobbies]}".center(50)
      index += 1
  end 
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end

#here we call the methods
students = input_students
print_header
print(students)
print_footer(students)
