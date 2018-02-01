class Bird

  attr_reader :name, :age

  def name=(value)
   if value == ""
   	 raise "Name can't be blank!"
   end
   @name = value
  end

  def age=(value)
  	if value < 0
  	  raise "An age of #{value} isn`t valid!"
  	end
  	@age = value
  end

  def report_age
  	puts "#{@name} is #{@age} years old."
  end

  def talk
    puts "#{@name} says Chirp! Chirp!"
  end

  def move(destination)
    puts "#{@name} flys to the #{destination}"
  end
end

class Dog
  
  attr_reader :name, :age

  def name=(value)
   if value == ""
   	 raise "Name can't be blank!"
   end
   @name = value
  end

  def age=(value)
  	if value < 0
  	  raise "An age of #{value} isn`t valid!"
  	end
  	@age = value
  end

  def report_age
  	puts "#{@name} is #{@age} years old."
  end

  def talk
  	puts "#{@name} says Bark!"
  end

  def move(destination)
  	puts "#{@name} runs to the #{destination}"
  end
end

class Cat

  attr_reader :name, :age

  def name=(value)
   if value == ""
   	 raise "Name can't be blank!"
   end
   @name = value
  end

  def age=(value)
  	if value < 0
  	  raise "An age of #{value} isn`t valid!"
  	end
  	@age = value
  end

  def report_age
  	puts "#{@name} is #{@age} years old."
  end

  def talk
    puts "#{@name} says Meow!"
  end

  def move(destination)
    puts "#{@name} runs to the #{destination}"
  end
end

dog = Dog.new
dog.name = "Daisy"
dog.age = 3
dog.report_age
dog.talk
dog.move("bed")