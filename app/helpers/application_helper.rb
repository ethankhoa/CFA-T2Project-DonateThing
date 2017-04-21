module ApplicationHelper

  def address_check
    @user.address.line_1.nil?
  end

  def phone_check
    @user.address.telephone.nil?
  end
end
