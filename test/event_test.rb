require 'minitest/autorun'
require 'minitest/pride'
require './lib/event.rb'
require './lib/food_truck.rb'
require './lib/item.rb'

class EventTest < MiniTest::Test

  def test_it_exists_and_has_name
    event = Event.new("South Pearl Street Farmers Market")

    assert_instance_of Event, event
    assert_equal "South Pearl Street Farmers Market", event.name
  end

  def test_it_has_no_food_trucks_by_default
    event = Event.new("South Pearl Street Farmers Market")

    assert_equal [], event.food_trucks
  end

end
