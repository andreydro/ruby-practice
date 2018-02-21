lines = []
File.open("votes.txt") do |file|
  lines = file.readlines
end

votes = Hash.new(0)

lines.each do |line|
  name = line.chomp
  name.upcase!
  votes[name] += 1
end

votes.each do |name, count|
  puts "#{name}: #{count}"
end

class Candidate
  attr_accessor :name, :age, :occupation, :hobby, :birthplace
  def initialize(name, age:, occupation:, hobby: nil, birthplace: "Sleepy Creek")
    self.name = name
    self.age = age
    self.occupation = occupation
    self.hobby = hobby
    self.birthplace = birthplace
  end
end

def print_summary(candidate)
  puts "Candidate: #{candidate.name}"
  puts "Age: #{candidate.age}"
  puts "Occupation #{candidate.occupation}"
  puts "Hobby: #{candidate.hobby}"
  puts "Birthplace: #{candidate.birthplace}"
end

candidate = Candidate.new("Amy Nguyen", age: 49, occupation: "Attorney", hobby: "Snowboard", birthplace: "Tokio")
p candidate