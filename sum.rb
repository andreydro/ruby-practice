def sum(array)
  if array == []
  	return 0
  else
    array[0] + sum(array[1..-1])
  end
end

array = [1,2,3]
puts sum(array)