require 'pry'
class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if !@inventory[item]
      0
    else
      @inventory[item]
    end
  end

  def stock(item, quantity)
    if @inventory[item]
      @inventory[item] += quantity
    else
      @inventory[item] = quantity
    end
  end

  def potential_revenue
    @inventory.sum do |item|
      item[0].price.delete("$").to_f * item[1]
    end
  end
end
