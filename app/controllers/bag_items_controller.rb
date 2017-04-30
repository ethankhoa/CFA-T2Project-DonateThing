class BagItemsController < ApplicationController
  before_action :set_bag_item, only: [:destroy, :update]

  def new
    @bag_item = BagItem.new
  end

  def create
    # @donation_bag = BagItem.find(params[:id])
    # @bag_item = @donation_bag.bag_items.new(bag_item_params)
    # @donation_bag.save
    # session[:donation_bag_id] = @donation_bag.id
    @bag_item = BagItem.new(bag_item_params)
    @bag_item.save
    redirect_to request.referer || root_path
  end

  def update
    @donation_bag = current_bag
    @bag_item = @donation_bag.bag_items.bag_item.find(params[:id])
    @bag_item.update_attributes(bag_item_params)
    @bag_items = @donation_bag.bag_items
  end

  def destroy
    # @donation_bag = current_bag
    # @bag_item = @donation_bag.bag_items.find(params[:id])
    @bag_item.destroy
    # @bag_items = @donation_bag.bag_items
    respond_to do |format|
      format.html { redirect_to request.referer || root_path, notice: 'Donation item was successfully removed.' }
      format.json { head :no_content }
    end

  end

private

  def set_bag_item
    @bag_item = BagItem.find(params[:id])
  end

  def bag_item_params
    params.require(:bag_item).permit(:quantity, :product_id, :donation_bag_id)
  end


end
