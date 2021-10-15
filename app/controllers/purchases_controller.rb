class PurchasesController < ApplicationController
  def index
    
  end

  def new
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(Purchase_params)
    if @purchase_shipping.valid?
      @purchase_shipping.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :area_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id)
  end
end
