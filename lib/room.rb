class Room
  attr_reader :category, :length, :width
  def initialize (category, length, width)
    @category = category
    @length = length
    @width = width
  end
require 'pry'; binding.pry
  def area
    length * width = area_of_room
    area_of_room
  end
end
