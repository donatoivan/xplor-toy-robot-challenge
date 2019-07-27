class Robot
  attr_accessor :compass, :placed, :commands
  def initialize
    @commands = []
    @compass = ["NORTH", "EAST", "SOUTH", "WEST"]
    @x_coordinate = 0
    @y_coordinate = 0
    @placed = false
  end
end