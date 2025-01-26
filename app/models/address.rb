class Address < ApplicationRecord
  belongs_to :order
  validates :post_code, :prefecture_id, :city_ward_town_village, :street_address, :phone_number, presence: true
  validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンを含む形式で入力してください' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁または11桁の数字のみ入力してください' }
end
