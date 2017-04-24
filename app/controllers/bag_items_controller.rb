class BagItemsController < ApplicationController
  def create
    @bag = current_bag
    @bag_item = @bag.bag_items.new(bag_item_params)
    @bag.save
    session[:bag_id] = @bag.id
  end

  def update
    @bag = current_bag
    @bag_item = @bag.bag_items.find(params[:id])
    @bag_item.update_attributes(bag_item_params)
    @bag_items = @bag.bag_items
  end

  def destroy
    @bag = current_bag
    @bag_item = @bag.bag_items.find(params[:id])
    @bag_item.destroy
    @bag_items = @bag.bag_items
  end

private

  def bag_item_params
    params.require(:bag_item).permit(:quantity, :product_id)
  end
end
