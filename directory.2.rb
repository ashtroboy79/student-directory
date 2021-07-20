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
    # puts "Add to system? yes, or no"
    # confirm = gets.chomp
      # if confirm == "yes"
        students <<  {name: name, cohort: cohort}
      # else
      #  puts "corrected details please"
      # end
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

# print out students grouped by cohort
def print(students)
  sorted_students = {}
  students.each do |student|
    cohort = student[:cohort].to_s
    name = student[:name].to_s
    if !sorted_students[cohort]
      sorted_students[cohort] = [name]
    else
      sorted_students[cohort].push(name)
    end
  end
  sorted_students.each do |cohort, students|
    puts cohort.center(50)
    puts students.center(50)
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
