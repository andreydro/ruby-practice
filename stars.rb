class CelestialBody
  attr_accessor :type, :name
end

altair = CelestialBody.new
altair.name = 'Altair'
altair.type = 'star'
polaris = altair
polaris.name = 'Polaris'
vega = polaris
vega.name = 'Vega'
#puts altair.name, polaris.name, vega.name
class LoveInterest
  
  def request_date
    if @busy
      puts "Sorry, I'm busy."
    else
  	  puts "Sure, let's go!"
  	  @busy = true
    end
  end

end

betty = LoveInterest.new
candace = betty

p betty.object_id
p candace.object_id

betty.request_date
candace.request_date