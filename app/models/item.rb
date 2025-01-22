class Item < ApplicationRecord
  validates :text, presence: true

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :content, presence: true
end
