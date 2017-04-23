class BagsController < ApplicationController
  def show
    @bag_items = current_bag.bag_items
  end
end
