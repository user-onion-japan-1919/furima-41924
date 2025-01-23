FactoryBot.define do
  factory :item do
    name { 'Sample Item' }
    description { 'This is a sample item description.' }
    price { 1000 }
    category { create(:category) }
    condition { create(:condition) }
    shipping_fee { create(:shipping_fee) }
    prefecture { create(:prefecture) }
    shipping_day { create(:shipping_day) }
    user { association :user } # associationを使ってuserを関連付ける

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
