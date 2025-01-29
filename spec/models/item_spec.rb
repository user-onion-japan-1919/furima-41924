require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'バリデーション' do
    it 'すべての属性が正しい場合、保存できる' do
      item = build(:item)
      expect(item).to be_valid
    end

    it 'nameが空だと登録できない' do
      item = build(:item, name: '')
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it 'descriptionが空だと登録できない' do
      item = build(:item, description: '')
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it 'priceが空だと登録できない' do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it 'priceが数値でないと登録できない' do
      item = build(:item, price: 'invalid')
      item.valid?
      expect(item.errors[:price]).to include('is not a number') # 修正点
    end

    it 'priceが300未満だと登録できない' do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include('must be greater than or equal to 300')
    end

    it 'priceが9,999,999を超えると登録できない' do
      item = build(:item, price: 10_000_000)
      item.valid?
      expect(item.errors[:price]).to include('must be less than or equal to 9999999')
    end

    it 'categoryが未選択(1)の場合、登録できない' do
      item = build(:item, category_id: 1)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it 'conditionが未選択(1)の場合、登録できない' do
      item = build(:item, condition_id: 1)
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    it 'shipping_feeが未選択(1)の場合、登録できない' do
      item = build(:item, shipping_fee_id: 1)
      item.valid?
      expect(item.errors[:shipping_fee_id]).to include("can't be blank")
    end

    it 'prefectureが未選択(1)の場合、登録できない' do
      item = build(:item, prefecture_id: 1)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

    it 'shipping_dayが未選択(1)の場合、登録できない' do
      item = build(:item, shipping_day_id: 1)
      item.valid?
      expect(item.errors[:shipping_day_id]).to include("can't be blank")
    end
  end

  # アソシエーションテスト
  describe 'アソシエーション' do
    it 'userとの関連がある' do
      association = Item.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'categoryとの関連がある' do
      association = Item.reflect_on_association(:category)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'conditionとの関連がある' do
      association = Item.reflect_on_association(:condition)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'shipping_feeとの関連がある' do
      association = Item.reflect_on_association(:shipping_fee)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'prefectureとの関連がある' do
      association = Item.reflect_on_association(:prefecture)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'shipping_dayとの関連がある' do
      association = Item.reflect_on_association(:shipping_day)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
