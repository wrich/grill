require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "calc the total for one item" do
    order = Order.new
    order.save
    steak = Item.new(name: 'Steak 7oz', price: 15)
    steak.save
    
    order.order_items.create(order_id: order.id, item_id: steak.id, qty: 1)
    
    assert_equal 15, order.total
  end
  test "calc the total for multiple items" do
    order = Order.new
    order.save
    steak = Item.new(name: 'Steak 7oz', price: 15)
    steak.save
    shake = Item.new(name: 'Mint Shake', price: 8)
    shake.save
    order.order_items.create(order_id: order.id, item_id: steak.id, qty: 1)
    order.order_items.create(order_id: order.id, item_id: shake.id, qty: 2)
    
    assert_equal 31, order.total
  end
end
