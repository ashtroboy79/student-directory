@students = []

# get user input
def input_students
  puts "please enter the name of the students"
  puts "To finish, just hit return twice"
  # get student name
  name = gets.chomp
  # while the name is not empty, repeat the following
  while !name.empty? do
    # add student hash to array
    @students <<  {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from user
    name = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end 
end

def print_menu
  # 1. print the menu and ask the userwhat to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" 
end

def show_students
  print_header
  print_student_list
  print_footer
end


def process(selection)
  case selection
    when "1"
      # input the students
      input_students
    when "2"
      # show the students
      show_students
    when "3"
      save_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end 
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end








interactive_menu

