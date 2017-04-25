class DonationBag < ApplicationRecord
  belongs_to :user
  belongs_to :bag_status
  has_many :bag_items
end
