 class Transportation
  def initialize
    @speed = 0
    @direction = 'north'
  end

  def brake
    @speed = 0
  end

  def accelerate
    @speed += 10
  end

  def turn(new_direction)
    @direction = new_direction
  end
end


class Car < Transportation
   def initialize
    super
    @fuel = 'deisel'
    @model = 'f150'
    @make = 'ford'
  end

  def honk_horn
    puts "Beeeeeeep!"
  end

  def print_info
    puts "This car can go #{@speed} mph."
  end

end

class Bike < Transportation
   def initialize
    super
    @frame = 'mens'
    @type = 'street'
    @brakes = 'fix'
  end

  def ring_bell
    puts "Ring ring!"
  end


  def print_info
    puts "This bike can go #{@speed} mph."
  end

end

bike = Bike.new
bike.accelerate
bike.print_info
bike.ring_bell

car = Car.new
car.accelerate
car.print_info
car.honk_horn
