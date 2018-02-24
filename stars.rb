class CelestialBody
  attr_accessor :type, :name
end

bodies = Hash.new { |hash, key|
  body = CelestialBody.new
  body.type = "planet"
  hash[key] = body 
}

bodies['Mars'].name = 'Mars'
bodies['Europe'].name = 'Europe'
bodies['Europe'].type = 'moon'
bodies['Venus'].name = 'Venus'

p bodies


#altair = Cele
#stialBody.new
#altair.name = 'Altair'
#altair.type = 'star'
#polaris = CelestialBody.new
#polaris.name = 'Polaris'
#polaris.type = 'star'
#vega = CelestialBody.new
#vega.name = 'Vega'
#vega.type = 'star'

#puts altair.name, polaris.name, vega.name
#class LoveInterest
#  
#  def request_date
#    if @busy
#      puts "Sorry, I'm busy."
#    else
#  	  puts "Sure, let's go!"
#  	  @busy = true
#    end
#  end

#end

#betty = LoveInterest.new
#candace = betty

#p betty.object_id
#p candace.object_id

#betty.request_date
#candace.request_date