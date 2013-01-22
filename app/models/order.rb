class Order < ActiveRecord::Base
  attr_accessible :address, :city, :state, :user_id, :zip
  
  belongs_to :user
  has_many :order_items
  
  def total
    running_total = 0
    self.order_items.each do |order_item|
      running_total += order_item.item.price * order_item.qty
    end
    return running_total
  end
end
