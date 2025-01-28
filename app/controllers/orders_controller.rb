class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :check_restrictions

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      # pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(
      :post_code, :prefecture_id, :city_ward_town_village,
      :street_address, :building_name, :phone_number, :token
    ).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: '該当する商品が見つかりませんでした。'
  end

  def check_restrictions
    redirect_to root_path, alert: '自分が出品した商品は購入できません。' if @item.user_id == current_user.id
    # redirect_to root_path, alert: 'この商品はすでに売却済みです。' if @item.sold_out
  end
end
