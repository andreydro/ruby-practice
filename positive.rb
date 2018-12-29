
def next_positive(array)
  positive = 1
  array.sort.each do |num|
  	if (num > 0 && num == positive)
  		positive += 1
  	end
  end
  positive
end

a = [1,2,4]
b = [5,1,2]
c = [-1,-3]
d = [1,2,3,4]

puts next_positive(a)
puts next_positive(b)
puts next_positive(c)
puts next_positive(d)