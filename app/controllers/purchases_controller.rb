class PurchasesController < ApplicationController
  before_action :index_to_move, only: :index
  
  def index
    @purchase_shipping = PurchaseShipping.new
    @item = Item.find(params[:item_id,])
  end

  def create
    @item = Item.find(params[:item_id,])
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :area_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy' 
      )
  end

  def index_to_move
    @item = Item.find(params[:item_id,])
    redirect_to root_path unless user_signed_in? && @item.purchase.blank? && current_user =! @item.user
  end
end
