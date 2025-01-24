class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    @order.user = current_user
    @order.item = @item

    if @order.save
      # 購入完了処理
      @item.update(status: 'sold') # 商品のステータスを更新（必要な場合）
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
