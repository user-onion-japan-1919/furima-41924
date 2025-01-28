class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city_ward_town_village,
                :street_address, :building_name, :phone_number

  # バリデーション
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city_ward_town_village
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
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
end
