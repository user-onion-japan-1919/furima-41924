class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @item = Item.find(params[:item_id])

    # 現在のユーザーが商品の出品者である場合、トップページにリダイレクト
    redirect_to root_path, alert: '自分が出品した商品は購入できません。' if @item.user == current_user

    # 商品が売却済みか確認
    redirect_to root_path, alert: 'この商品はすでに売却済みです。' if @item.sold_out

    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    @order.user = current_user
    @order.item = @item

    if @order.save
      # 購入完了処理
      @item.update(sold_out: true) # 商品の売却済み状態を更新
      redirect_to order_path(@order), notice: '購入が完了しました。'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:address, :payment_method)
  end
end
