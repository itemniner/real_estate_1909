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
    assert_equal "$400000", @house.price
  end

  def test_it_has_address
    assert_equal "123 sugar lane", @house.address
  end

  def test_it_has_rooms
    assert_equal [], @house.rooms
  end

  def test_add_room_method
    assert @house.add_room("x")
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
    @house.add_room(room_2)
    assert_equal [room_1, room_2], @house.rooms
  end

  def test_it_adds_all_room
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    @house.add_room(room_1)
    @house.add_room(room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)
    assert_equal [room_1, room_2, room_3, room_4], @house.rooms
  end

  def test_it_can_find_room_category_bedroom
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    @house.add_room(room_1)
    @house.add_room(room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)
    @house.rooms_from_category(:bedroom)
    assert_equal [room_1, room_2], @house.rooms_from_category(:bedroom)
  end

  def test_it_can_find_room_category_basement
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    @house.add_room(room_1)
    @house.add_room(room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)
    @house.rooms_from_category(:basement)
    assert_equal [room_4], @house.rooms_from_category(:basement)
  end

  def test_it_can_find_room_category_no_category
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    @house.add_room(room_1)
    @house.add_room(room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)
    @house.rooms_from_category(:loft)
    assert_equal [], @house.rooms_from_category(:loft)
  end

  def test_area_of_house
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    @house.add_room(room_1)
    @house.add_room(room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)
    assert_equal 1900, @house.area
  end
end
