require 'minitest/autorun'
require 'minitest/pride'
require './lib/item.rb'
require './lib/food_truck.rb'

class FoodTruckTest < MiniTest::Test

  def test_it_exists_and_has_name
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    assert_instance_of FoodTruck, food_truck
    assert_equal "Rocky Mountain Pies", food_truck.name
  end

  def test_it_has_no_stock_by_default
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    assert_equal ({}), food_truck.inventory
  end

  def
end
