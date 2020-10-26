class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    if user_signed_in?
       @item = Item.new
    else
       redirect_to user_session_path(@item.id)
    end
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to items_path
    else
       render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end 

  private
  def item_params
    params.require(:item).permit(:item_image, :item_name, :item_info, :category_id, :item_state_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              