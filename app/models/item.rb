class Item < ApplicationRecord
  validates :image, :name, :description, :price, presence: true

  validates :category_id, presence: { message: "can't be blank" }
  validates :condition_id, presence: { message: "can't be blank" }
  validates :shipping_fee_id, presence: { message: "can't be blank" }
  validates :prefecture_id, presence: { message: "can't be blank" }
  validates :shipping_day_id, presence: { message: "can't be blank" }

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }

  # ActiveHashの関連付け
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  # belongs_to :shipping_day

  # belongs_to :user
  # has_one :order
  # has_one_attached :image

  # 販売手数料を計算（10%の手数料として設定）
  def sales_fee
    (price * 0.1).floor # 小数点以下を切り捨て
  end

  # 販売利益を計算（販売価格 - 販売手数料）
  def profit
    (price - sales_fee).floor # 小数点以下を切り捨て
  end

  # shipping_fee_status メソッドを追加
  def shipping_fee_status
    shipping_fee.try(:status) # もし status メソッドが shipping_fee モデルにあれば取得
  end
end
