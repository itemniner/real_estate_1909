class Room
  attr_reader :category, :length, :width
  def initialize (category, length, width)
    @category = category
    @length = length
    @width = width
  end

  def area
    area_of_room = length * width
  end
end
