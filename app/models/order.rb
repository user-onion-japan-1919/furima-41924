class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address, dependent: :destroy

  # ステータス管理：購入が完了したかどうかなど
  enum status: { pending: 0, completed: 1, canceled: 2 }

  # 仮想属性
  attr_accessor :token

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }

  # バリデーション（必要に応じて追加）
  validates :price, presence: true
  validates :address, presence: true
  validates :payment_method, presence: true

  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンを含む形式で入力してください' }
  validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }
  validates :city_ward_town_village, :street_address, :phone_number, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁または11桁の数字のみ入力してください' }
  validates :token, presence: true
end
