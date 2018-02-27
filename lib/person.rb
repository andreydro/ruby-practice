class Person
  attr_accessor :name
  def introduction
    person = Person.new
    person.name = 'Bob'
    puts person.introduction == 'Hello, my name is Bob!'
  end
end