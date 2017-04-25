class ProductsController < ApplicationController
  before_action :set_product, only: [:destroy, :update]


  def index
    @products = Product.all
    # @bag_item = current_bag.bag_items.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def update
    @product.update_attributes(product_params)
  end

private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price)
  end

end
