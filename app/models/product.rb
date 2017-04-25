class Product < ApplicationRecord
  has_many :bag_items

  default_scope { where(active: true) }
end
