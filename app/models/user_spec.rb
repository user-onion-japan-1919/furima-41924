require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user) # FactoryBotでユーザーのテストデータを作成
    end

    context '新規登録できる場合' do
      it '全ての項目が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = '' # nicknameを空にする
        @user.valid? # バリデーションを実行
        expect(@user.errors.full_messages).to include("Nickname can't be blank") # エラー確認
      end

      it 'emailが空では登録できない' do
        @user.email = '' # emailを空にする
        @user.valid? # バリデーションを実行
        expect(@user.errors.full_messages).to include("Email can't be blank") # エラー確認
      end
    end
  end
end
