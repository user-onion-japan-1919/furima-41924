FactoryBot.define do
  factory :address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city_ward_town_village { '横浜市緑区' }
    street_address { '青山1-1-1' }
    building_name { '柳ビル103' }
    phone_number { '09012345678' }
    association :order
  end
end
