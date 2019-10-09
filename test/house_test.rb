require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test
  def setup
    @house = House.new("$400000", "123 sugar lane")
  end

  def test_it_exist
    assert_instance_of House, @house
  end

  def test_it_has_price
    assert_equal "$400000", @house.test_it_has_price
  end

  def test_it_has_address
    assert_equal "123 sugar lane", @house.address
  end

  def test_it_has_rooms
    assert_equal [], @house.rooms
  end

  def test_add_room_method
    assert @house.add_room
  end

  def test_it_can_add_room
    room_1 = Room.new(:bedroom, 10, 13)
    @house.add_room(room_1)
    assert_equal [room_1], @house.rooms
  end

  def test_it_can_add_multiple_rooms
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    @house.add_room(room_1)
    @house.add_room(room_1)
    assert_equal [room_1, room_2], @house.rooms
  end
end
