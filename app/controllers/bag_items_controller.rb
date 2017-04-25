class BagItemsController < ApplicationController

  def create
    @donation_bag = current_bag
    @bag_item = @donation_bag.bag_items.new(bag_item_params)
    @donation_bag.save
    session[:donation_bag_id] = @donation_bag.id
  end

  def update
    @donation_bag = current_bag
    @bag_item = @donation_bag.bag_items.find(params[:id])
    @bag_item.update_attributes(bag_item_params)
    @ag_items = @donation_bag.bag_items
  end

  def destroy
    @bag = current_bag
    @bag_item = @donation_bag.bag_items.find(params[:id])
    @bag_item.destroy
    @bag_items = @donation_bag.bag_items
  end

private

  def bag_item_params
    params.require(:bag_item).permit(:quantity, :product_id)
  end


end
