FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { 'password1' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_furigana    { 'ヤマダ' }
    first_name_furigana   { 'タロウ' }
    date_of_birth         { '1990-01-01' }
  end
end
