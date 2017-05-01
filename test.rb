def open_file(filename)
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      puts line
    end
  end
end

open_file(__FILE__)
