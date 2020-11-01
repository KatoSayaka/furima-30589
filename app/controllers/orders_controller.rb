class OrdersController < ApplicationController
  before_action :order_item, only:[:index,:create]
  before_action :authenticate_user!, only:[:index, :create]
  before_action :move_to_root_path, only: [:index]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
       pay_item
       @order_address.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address_num, :building_name, :phone, :item_id, :token).merge(user_id: current_user.id)
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end

  def order_item
    @item = Item.find(params[:item_id])
  end
  
  def move_to_root_path
    if current_user == @item.user || @item.order.present?
      redirect_to root_path
    end
  end

end
