require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  context '内容に問題がない場合' do
    it '全ての情報が正しく入力されていれば保存できること' do
      expect(@address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'post_codeが空では保存できないこと' do
      @address.post_code = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeが「123-4567」の形式でないと保存できないこと' do
      @address.post_code = '1234567'
      @address.valid?
      expect(@address.errors.full_messages).to include('Post code は「123-4567」の形式で入力してください')
    end

    it 'phone_numberが空では保存できないこと' do
      @address.phone_number = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが10桁または11桁でないと保存できないこと' do
      @address.phone_number = '12345'
      @address.valid?
      expect(@address.errors.full_messages).to include('Phone number は10桁または11桁の数字で入力してください')
    end
  end
end
