class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city_ward_town_village,
                :street_address, :building_name, :phone_number, :token

  # バリデーション
  with_options presence: true do
    validates :user_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  end
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
  validates :prefecture, :post_code, :city_ward_town_village, :street_address, :phone_number, :token, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁または11桁の数字のみ入力してください' }
end

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
