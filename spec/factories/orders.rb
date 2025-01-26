FactoryBot.define do
  factory :order do
    price { 3000 }
    token { 'tok_abcdefghijk00000000000000000' }
    payment_method { 'クレジットカード' } # 仮の値を設定
    association :user
    association :item
  end
end
