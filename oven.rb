class OvenOffError < StandardError
end
class OvenEmptyError < StandardError
end

class SmallOven
  attr_accessor :contents

  def turn_on
    puts "Turning oven on."
    @state = "on"
  end

  def turn_off
    puts "Turning oven off"
    @state = "off"
  end

  def bake
    unless @state == "on"
      raise OvenOffError, "You need to turn the oven on first"
    end
    if @contents == nil
      raise OvenEmptyError, "There`s nothing in the oven!"
    end
    "golden-brown #{contents}"
  end

end

dinner = ['turkey', nil, 'pie']
oven = SmallOven.new
dinner.each do |item|
  begin
  	oven.turn_on
  	oven.contents = item
  	puts "Serving #{oven.bake}"
  rescue OvenEmptyError => error
  	puts "Error: #{error.message}"
  ensure
  	oven.turn_off
  end
end


=begin
class TestScoreError < StandardError
end

score = 52
begin
  if score > 60
  	puts "passing grade"
  else
  	raise TestScoreError, "failing grade"
  end
rescue TestScoreError => error
  puts "Received #{error.message}. Taking make-up exam..."
  score = 63
  retry
end


# practice 1
def drive(destination)
  if destination == "Hawaii"
    raise "You can't drive to Hawaii!"
  end
end

begin
  drive("Hawaii")
rescue => error
  puts error.message
end


# practice 2
class PorridgeError < StandardError
end
class BeddingError < StandardError
end

def eat
  raise PorridgeError, "too hot"
end

def sleep
  raise BeddingError, "too soft"
end

begin
  sleep
rescue BeddingError => error
	puts "This bed is #{error.message}!"
rescue PorridgeError => error
	puts "This porridge is #{error.message}!"
end
=end