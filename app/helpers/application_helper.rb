module ApplicationHelper

  def address_check
    @user.address.line_1.nil?
  end

  def phone_check
    @user.address.telephone.nil?
  end

  def current_user
    if @current_user
      return @current_user
    elsif session[:user_id] && user = User.where(:id => session[:user_id]).first
      @current_user = user
      return @current_user
    end
  end

  def current_bag
  unless @current_bag
    if current_user
      donation_bag = current_user.donation_bag || DonationBag.create(:user => current_user)
      @current_bag = donation_bag
    elsif session[:donation_bag_id]
      @current_bag = DonationBag.where(:id => session[:donation_bag_id]).first || DonationBag.create
    else
      @current_bag = DonationBag.create
    end
  end
  return @current_cart
end

end
