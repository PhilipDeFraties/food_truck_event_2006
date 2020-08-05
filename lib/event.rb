class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.check_stock(item) > 0
    end
  end

  def all_items
    all_items = @food_trucks.flat_map do |food_truck|
      food_truck.inventory.keys.find_all do |item|
        food_truck.check_stock(item) > 0
      end
    end.uniq
  end

  def sorted_item_list
    all_items.map do |item|
      item.name
    end.sort
  end

  def total_inventory
    total = {}
    all_items.each do |item|
      food_trucks = food_trucks_that_sell(item)
      quantity = food_trucks.sum do |food_truck|
        food_truck.check_stock(item)
      end
      total[item] = {
        food_trucks: food_trucks,
        quantity: quantity
      }
    end
    total
  end

  def over_stocked_items
    all_items.find_all do |item|
      food_trucks_that_sell(item).count > 1 &&
      total_inventory[item][:quantity] > 50
    end
  end
end
