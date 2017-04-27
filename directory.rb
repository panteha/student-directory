def input_students
  puts "Please enter the names of the student, hobbies, country of birth, cohort:"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
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

    students << {name: entry[0], hobby: entry[1],
                 country: entry[2], cohort: entry[3].to_sym}

    puts "Now we have #{students.count} great students"
    name = gets.chomp

    entry = name.split(",")


  end
  students
end

def pick_letter(students)
  puts "Which specific letter do you choose?"
  letter = gets.chomp
  puts "*****************************************************************************************"
  puts "List the students whose names start with letter #{letter.upcase} or #{letter.downcase} and are shorter than 12 characters"
  puts "*****************************************************************************************"
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
        puts "#{i+1}. #{picked_student[i][:name].center(15, " ")}hobby:#{picked_student[i][:hobby].center(15, " ")}country of birth:#{picked_student[i][:country].center(15, " ")}cohort:#{picked_student[i][:cohort].to_s.center(15, " ")}"
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
