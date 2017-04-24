class ProductsController < ApplicationController
  def index
    @products = Product.all
    @bag_item = current_bag.bag_items.new
  end
end
