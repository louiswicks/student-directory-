def print_file
  file = File.open($0, "r")
    file.readlines.each do |line|
      puts line
    end
  file.close
end

print_file
