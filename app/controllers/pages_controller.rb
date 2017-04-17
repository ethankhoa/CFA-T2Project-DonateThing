class PagesController < ApplicationController
  before_action :set_current_user, only: [:dashboard]
  before_action :authenticate_user!, :except => [:home, :about, :contact]


  def home
  end

  def contact
  end

  def about
  end

  def dashboard
  end

  private

  def set_current_user
    @user = current_user
  end

end
