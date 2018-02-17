lines = []
File.open("votes.txt") do |file|
  lines = file.readlines
end

elements = { "H" => "Hydrogen", "Li" => "Lithium"}

puts elements["Li"]
puts elements["H"]

#mush = { 1 => "one", "two" => 2, :three => 3.0 }

#p mush[:three]
#p mush[1]
#p mush["two"]

#my_hash = {"one" => "two", :three => "four", 5 => "six"}
#puts my_hash[5]
#puts my_hash["one"]
#puts my_hash[:three]
#my_hash["seven"] = 8
#puts my_hash["seven"]

#protons = {"H" => 1, "Li" => 3, "Ne" => 10}
#puts protons.class

#protons.each do |element, count|
#  puts "#{element}: #{count}"
#end

votes = Hash.new(0)

lines.each do |line|
  name = line.chomp
  name.upcase!
  votes[name] += 1
end

p votes

#school = {
#  "Simone" => "here",
#  "Jeanie" => "here"
#}

#names = ["Simone", "Ferriss", "Jeanie", "Cameron"]

## names.each do |name|
##  if school[name]
##  	puts "#{name} is present"
##  else
##  	puts "#{name} is absent"
##  end
##end

votes = Hash.new(0)
votes["Amber Graham"] = 1
p votes["Amber Graham"]
p votes["amber graham"]