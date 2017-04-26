def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} great students"
    name = gets.chomp
  end
  students
end

def pick_letter(students)
  puts "Which specific letter do you choose?"
  letter = gets.chomp
  puts "We are going to list the students whose name starts with letter #{letter} and is shorter than 12 character"
  picked_student = []
  students.each do |student|
    picked_student << student if (student[:name].downcase.start_with? letter.downcase) && (student[:name].delete(" ").length < 12)
  end
  return picked_student
end

def print_header
  puts "The students of Makers Academy"
  puts "-------------"
end

def print(picked_student)

  picked_student.each_with_index do |picked_student, index|
  puts "#{index+1}. #{picked_student[:name]} (#{picked_student[:cohort]} cohort)"
end
end

def print_footer(names)
  puts "Overall, we have #{names.count} chosen great students."
end

students = input_students
picked_student = pick_letter(students)
print_header
print(picked_student)
print_footer(picked_student)
