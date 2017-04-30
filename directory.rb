@students = []
def input_students
  puts "Please enter the names of the student, hobbies, country of birth, cohort:"
  puts "To finish, just hit return twice"
  name = gets
  name.gsub!("\n","")
  entry = name.split(",")
  while !entry.empty? do
    for i in 0..2
      if (entry[i] == "" || entry[i] == nil || entry[i] == " " )
        entry[i] = "Blank"
      end
    end

    if (entry[3] == "" || entry[3] == nil || entry[3] == " ")
      entry[3] = "november"
    end

    @students << {name: entry[0], hobby: entry[1], country: entry[2], cohort: entry[3].to_sym}

    if @students.count == 1
      puts "Now we have #{@students.count} great student."
    else
      puts "Now we have #{@students.count} great students."
    end
    name = gets
    name.gsub!("\n","")
    entry = name.split(",")
  end
  #students
end

def pick_letter
  if @students.count != 0
  puts "Which specific letter do you choose?"
  letter = gets
  letter.gsub!("\n","")
  picked_student = []
  @students.each do |student|
    picked_student << student if (student[:name].downcase.start_with? letter.downcase) && (student[:name].delete(" ").length < 12)
  end
  if picked_student.count != 0
    puts "*****************************************************************************************"
    puts "List the students whose names start with letter #{letter.upcase} or #{letter.downcase} and are shorter than 12 characters"
    puts "*****************************************************************************************"
  end
  return picked_student
end
end

def print_header(picked_student)
  if picked_student.count != 0
    puts "The students of Makers Academy"
    puts "-------------"
  end
end

def print(picked_students)

  cohort_list = picked_students.map do |student|
    student[:cohort]
  end
  cohort_list = cohort_list.sort.uniq
  i = 0
  cohort_list.each do |cohort|
    cohort_students = picked_students.find_all {|student| student[:cohort] == cohort}
    cohort_students.each do |student|
      puts "#{i+1}. #{student[:name].center(15, " ")}hobby:#{student[:hobby].center(15, " ")}country of birth:#{student[:country].center(15, " ")}cohort:#{student[:cohort].to_s.center(15, " ")}"
      i += 1
    end
  end

end

def print_footer(names)
  if names.count == 0
    puts "Overall, we have #{names.count} chosen great student."
  elsif names.count == 1
    puts "Overall, we have #{names.count} chosen great student."
  else
    puts "Overall, we have #{names.count} chosen great students."
  end
end

# Interactive menu:

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exist"
end

def show_student
  picked_student = pick_letter
  if picked_student != nil
    print_header(picked_student)
    print(picked_student)
    print_footer(picked_student)
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:hobby], student[:country], student[:cohort]]
    csv_file = student_data.join(",")
    file.puts csv_file
  end
  file.close
  puts "File saved"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_student
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
