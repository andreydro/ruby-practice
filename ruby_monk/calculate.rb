def calculate(*numbers)
  new_array = numbers.dup
  options = numbers.pop
  if options.is_a?(Hash)
    if options[:subtract]
      subtract(*numbers)
    else
      add(*numbers)
    end
  else
    add(*new_array)
  end
end

def add(*numbers)
  numbers.inject(0) {|sum, number| sum + number}
end

def subtract(*numbers)
  total = numbers[0]
  numbers = numbers[1..-1]
  numbers.each do |e|
    total -= e
  end
  return total
end