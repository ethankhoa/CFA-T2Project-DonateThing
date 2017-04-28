class Org < ApplicationRecord
  belongs_to :user
  has_one :address, :as => :addressable
  has_many :donations

  acts_as_messageable

end
