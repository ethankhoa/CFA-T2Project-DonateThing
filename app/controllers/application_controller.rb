class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_bag

  def current_bag
    if !session[:bag_id].nil?
      Bag.find(session[:bag_id])
    else
      Bag.new
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
