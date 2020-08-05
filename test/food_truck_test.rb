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

  def test_item_is_not_stocked_by_default
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    assert_equal 0, food_truck.check_stock(item1)
  end

  def test_it_can_stock_item
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    food_truck.stock(item1, 30)

    assert_equal 30, food_truck.check_stock(item1)
    assert_equal ({item1 => 30}), food_truck.inventory

    food_truck.stock(item1, 25)

    assert_equal 55, food_truck.check_stock(item1)

    food_truck.stock(item2, 12)

    assert_equal ({item1 => 55, item2 => 12}), food_truck.inventory
  end
end
