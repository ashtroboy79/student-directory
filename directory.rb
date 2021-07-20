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

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the userwhat to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" 
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
      when "1"
        # input the students
        students = input_students
      when "2"
        # show the students
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit # this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
  end 
end



interactive_menu

