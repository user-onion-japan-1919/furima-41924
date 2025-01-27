class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city_ward_town_village,
                :street_address, :building_name, :phone_number, :token

  # バリデーション
  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンを含む形式で入力してください' }
  validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }
  validates :city_ward_town_village, :street_address, :phone_number, :token, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁または11桁の数字のみ入力してください' }

  def save
    # 購入情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)

    # 配送先情報を保存
    Address.create(
      post_code: post_code, prefecture_id: prefecture_id,
      city_ward_town_village: city_ward_town_village,
      street_address: street_address, building_name: building_name,
      phone_number: phone_number, order_id: order.id
    )
  end
end
