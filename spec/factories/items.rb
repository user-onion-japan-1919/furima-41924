FactoryBot.define do
  factory :item do
    name { 'テスト商品' }
    description { '商品の説明' }
    price { 3000 }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    association :user
  end
end
