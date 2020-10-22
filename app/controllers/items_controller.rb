class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  
  def item_params
    params.require(:item).permit(:item_image)
  end
end
