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
  puts "List the students whose names start with letter #{letter.upcase} or #{letter.downcase} and are shorter than 12 characters"
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
  i = 0
  while i < picked_student.length do
        puts "#{i+1}. #{picked_student[i][:name]} (#{picked_student[i][:cohort]} cohort)"
        i += 1
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
