class BagItem < ApplicationRecord
  belongs_to :bag

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  validate :product_present
  validate :bag_present

  before_save :finalize

  def total_quantity
    quantity
  end

  private

  def bag_present
    if bag.nil?
      errors.add(:bag, "is not a valid bag.")
    end
  end
end
