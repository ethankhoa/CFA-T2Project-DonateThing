class Bag < ApplicationRecord
  belongs_to :user
  belongs_to :bag_status
  has_many :bag_items
  after_create :set_bag_status
  before_save :update_itemtotal
  before_save :update_total_cost

  def itemtotal
    bag_items.collect { |bi| bi.valid? ? (bi.quantity) : 0 }.sum
  end

  def total_cost
    bag_items.collect { |bi| bi.valid? ? (bi.quantity * bi.unit_price) : 0 }.sum
  end

  private
  def set_bag_status
    self.bag_status_id = 1
  end

  def update_itemtotal
    self[:itemtotal] = total_items
  end

  def update_total_cost
    self[:total_cost] = total_cost
  end

end
