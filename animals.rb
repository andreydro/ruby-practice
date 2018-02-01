class Bird
  def talk(name)
    puts "#{name} says Chirp! Chirp!"
  end

  def move(name, destination)
    puts "#{name} flys to the #{destination}"
  end
end

class Dog
  def make_up_name
    @name = "Sandy"
  end

  def talk(name)
    puts "#{@name} says Bark!"
  end

  def move(destination)
    puts "#{@name} runs to the #{destination}"
  end

  def make_up_age
  	@age = 5
  end

  def report_age
  	puts "#{@name} is #{@age} years old"
  end
end

class Cat
  def talk(name)
    puts "#{name} says Meow!"
  end

  def move(name, destination)
    puts "#{name} runs to the #{destination}"
  end
end

dog = Dog.new
dog.make_up_name
dog.move("yard")
dog.make_up_age
dog.report_age