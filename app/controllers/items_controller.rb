class ItemsController < ApplicationController
 before_action :set_item, only: [:show, :edit, :update, :destroy]
 before_action :authenticate_user!, except:[:index, :show]


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

  def edit
    if current_user != @item.user || @item.order.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
       redirect_to root_path
    else
       render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
    end
    redirect_to root_path
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private
  def item_params
    params.require(:item).permit(:item_image, :item_name, :item_info, :category_id, :item_state_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end   




