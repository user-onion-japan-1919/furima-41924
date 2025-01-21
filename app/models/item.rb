class Item < ApplicationRecord
  validates :text, presence: true
end
