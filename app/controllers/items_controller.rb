class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :update, :show]

  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    # アイテムが正常に保存できたらリダイレクト
    if @item.save
      redirect_to root_path
    else
      # 保存に失敗した場合は新規作成ページに戻る
      render :new, status: :unprocessable_entity

    end
  end

  def show
    @item = Item.find(params[:id])
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
    params.require(:item).permit(:name, :description, :category_id, :condition_id,
                                 :shipping_fee_id, :prefecture_id, :shipping_day_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
