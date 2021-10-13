class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :contributor_confirmation, only: [:edit, :update]
  

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user == @item.user
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end

private

def item_params
  params.require(:item).permit(:image, :item_name, :text, :category_id, :condition_id, :commission_id, :area_id, :delivery_id, :price,).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end

def contributor_confirmation
  redirect_to root_path unless current_user == @item.user
end