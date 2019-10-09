require './lib/room'

class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
  @price = price
  @address = address
  @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    house_category = @rooms.find_all do |room|
    room.category == category
    end
  end

  def area
    house_area = @rooms.collect { |room| room.length * room.width}
    house_area.sum
  end

end
