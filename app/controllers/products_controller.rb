class ProductsController < ApplicationController
  def index
    @products = Product.all
    @bag_item = current_bag.bag_items.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
  end

private
  def product_params
    params.require(:product).permit(:name, :price)
  end

end
