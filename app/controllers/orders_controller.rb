class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :check_restrictions

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path, notice: '購入が完了しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(
      :post_code, :prefecture_id, :city_ward_town_village,
      :street_address, :building_name, :phone_number, :token
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の価格
      card: order_params[:token], # カードトークン
      currency: 'jpy'             # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find_by(id: params[:item_id])
    return if @item

    redirect_to root_path, alert: '該当する商品が見つかりませんでした。'
  end

  def check_restrictions
    if @item.user_id == current_user.id
      redirect_to root_path, alert: '自分が出品した商品は購入できません。'
    elsif @item.sold_out
      redirect_to root_path, alert: 'この商品はすでに売却済みです。'
    end
  end
end
