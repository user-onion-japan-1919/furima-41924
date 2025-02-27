class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :redirect_if_sold_out, only: [:edit, :update]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
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

  def destroy
    # ログインユーザーが出品者でなければ削除不可
    if current_user == @item.user
      @item.destroy
      redirect_to items_path, notice: '商品を削除しました。'
    else
      redirect_to items_path, alert: '削除できません。権限がありません。'
    end
  end

  def show
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

  def redirect_if_sold_out
    @item = Item.find(params[:id])
    return unless @item.order.present?

    flash[:alert] = '売却済み商品の編集はできません'
    redirect_to root_path
  end
end

# ✅ 他のユーザーが編集ページにアクセスしようとしたらトップページにリダイレクト
def check_owner
  return if current_user == @item.user

  redirect_to root_path, alert: '編集権限がありません。'
end
