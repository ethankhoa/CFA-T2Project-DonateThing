class Org < ApplicationRecord
  belongs_to :user
  has_one :address, :as => :addressable
end
