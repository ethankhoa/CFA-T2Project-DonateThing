class BagsController < ApplicationController
  before_action :set_current_user

  def show
    @bag_items = current_bag.bag_items
  end

  def new
  @bag = Bag.new
  end

  def create
    @bag = Bag.new
    @bag.user_id = current_user.id if current_user
    @bag_items = @bag.bag_items
    respond_to do |format|
      if @bag.save
        format.html { redirect_to @bag, notice: 'New donation bag was successfully created.' }
        format.json { render :show, status: :created, location: @bag }
      else
        format.html { render :show }
        format.json { render json: @bag.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_current_user
    @user = current_user

  end

end
