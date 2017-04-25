class DonationBag < ApplicationRecord
  belongs_to :user
  after_create :set_bag_status
  belongs_to :bag_status
  has_many :bag_items
  before_save :update_total_quantity

  def total_quantity
    bag_items.collect { |bi| bi.valid? ? (bi.quantity) : 0 }.sum
  end

  private
  def set_bag_status
    self.bag_status_id = 1 if self.bag_status_id.nil?
  end

  def update_total_quantity
    self[:total_quantity] = total_quantity
  end
end
