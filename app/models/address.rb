class Address < ApplicationRecord
  belongs_to :addressable, :polymorphic => true
end

def address_check
  current_user.address.line_1.nil?
end

def phone_check
  current_user.address.telephone.nil?
end
