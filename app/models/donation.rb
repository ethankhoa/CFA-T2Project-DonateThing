class Donation < ApplicationRecord
  belongs_to :donation_status
  belongs_to :user
  belongs_to :org
  belongs_to :donation_bag


end
