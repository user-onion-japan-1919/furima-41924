class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  # ステータス管理：購入が完了したかどうかなど
  enum status: { pending: 0, completed: 1, canceled: 2 }

  # 仮想属性
  attr_accessor :token

  # バリデーション（必要に応じて追加）
  validates :price, presence: true
  validates :address, presence: true
  validates :payment_method, presence: true
  validates :token, presence: true
end
