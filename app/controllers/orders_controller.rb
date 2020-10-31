class OrdersController < ApplicationController
  before_action :order_item, only:[:index,:create]

  def index
    @oreder = Order.all
  end

  def new
    @order = Order.new(order_params)
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
  
end
