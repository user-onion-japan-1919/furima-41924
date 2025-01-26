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

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    @order.user = current_user
    @order.item = @item

    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path

    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :new, index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:price, :address, :payment_method)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end
end
