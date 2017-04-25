class Product < ApplicationRecord
  has_many :bag_items
  belongs_to :user

  default_scope { where(active: true) }
end
