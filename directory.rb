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
  puts "Which letter do you want to see?"
  letter = gets.chomp
  picked_student = []
  students.each do |student|
    picked_student << student if student[:name].start_with? letter
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
