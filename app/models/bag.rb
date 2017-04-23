class Bag < ApplicationRecord
  belongs_to :user
  belongs_to :bag_status

  has_many :bag_items
  before_create :set_order_status
  before_save :update_itemtotal

  def itemtotal
    bag_items.collect { |bi| bi.valid? ? (bi.quantity) : 0 }.sum
  end

  private
  def set_order_status
    self.order_status_id = 1
  end

  def update_itemtotal
  self[:bagtotal] = total_items
  end

end
