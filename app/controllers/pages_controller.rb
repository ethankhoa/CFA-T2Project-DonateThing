class PagesController < ApplicationController
  before_action :set_current_user, only: [:dashboard, :map, :notifications, :messages]
  before_action :authenticate_user!, :except => [:home, :about, :contact]

  def home
  end

  def contact
  end

  def about
  end

  def notifications
  end

  def messages
  end

  def donate
    @products = Product.where(:user => current_user)
    @donation_bags_inprogress = DonationBag.where(:user => current_user, :bag_status => 1)
    @donation_bag = @donation_bags_inprogress.first
    @donation_bags_ready = DonationBag.where(:user => current_user, :bag_status => 1)
    @donation_bags_complete = DonationBag.where(:user => current_user, :bag_status => 3)
  end

  def map
  end

  def dashboard
    @donation_bags_inprogress = DonationBag.where(:user => current_user, :bag_status => 1)
    @donation_bag = @donation_bags_inprogress.first
    @donation_bags = Product.where(:user => current_user)
  end

  private

  def set_current_user
    @user = current_user
  end

end
