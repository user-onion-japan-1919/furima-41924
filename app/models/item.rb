class Item < ApplicationRecord
  validates :image, :name, :description, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }

  # ActiveHashの関連付け
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image
  has_one :order

  # 販売手数料を計算（10%の手数料として設定）
  def sales_fee
    (price * 0.1).floor # 小数点以下を切り捨て
  end

  # 販売利益を計算（販売価格 - 販売手数料）
  def profit
    (price - sales_fee).floor # 小数点以下を切り捨て
  end

  def shipping_fee_status
    shipping_fee.try(:status)
  end
end
