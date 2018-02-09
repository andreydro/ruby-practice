def each
  index = 0
  while index < self.length
    yield self[index]
    index += 1
  end
end