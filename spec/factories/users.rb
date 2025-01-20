# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    nickname { 'testuser' }
    email { Faker::Internet.unique.email } # Fakerを使って一意のemailを生成
    password { 'test123' }
    password_confirmation { 'test123' }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_furigana { 'ヤマダ' }
    first_name_furigana { 'タロウ' }
    date_of_birth { '1990-01-01' }
  end
end
