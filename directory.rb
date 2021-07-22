require 'csv'
@students = []

# get user input
def input_students
  puts "please enter the name of the students"
  puts "To finish, just hit return twice"
  # get student name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat the following
  while !name.empty? do
    # add student hash to array
    student_to_array(name, :novenmber)
    puts "Now we have #{@students.count} students"
    # get another name from user
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end 
end

def print_menu
  # 1. print the menu and ask the userwhat to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a csv file"
  puts "4. Load the list from a csv file"
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
    when "4"
      load_students
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
  filename = get_filename
  CSV.open(filename, "wb") do |csv|
  #iterate over the array of students
    @students.each do |student|
     csv << [student[:name], student[:cohort]]
    end
  end
  puts "Saved #{@students.count} to #{filename}"
end

def load_students(filename = "students.csv")
  filename = get_filename
  if File.exist?(filename)
    CSV.foreach(filename) do |row|
      name, cohort = row
      student_to_array(name, cohort.to_sym)
    end
    puts "Loaded #{@students.count} from #{filename}"
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil?
  if File.exists?(filename) # if it exists
    load_students(filename)
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def student_to_array(name, cohort)
  @students << {name: name, cohort: cohort}
end

def get_filename
  puts "Please enter filename: "
  filename = gets.chomp
  return filename
end

try_load_students
interactive_menu

