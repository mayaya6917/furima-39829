class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :require_permission, only: [:edit, :update]
  before_action :set_item, only: [:edit, :update, :show]


  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :image, :category_id, :sales_status_id, :shopping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def require_permission
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
