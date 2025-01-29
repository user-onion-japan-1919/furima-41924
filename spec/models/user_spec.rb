require 'rails_helper'

RSpec.describe User, type: :model do
  # FactoryBotを使ってインスタンスを生成
  let(:user) { FactoryBot.build(:user) }

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての項目が正しく入力されていれば登録できる' do
        expect(user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        user.name = ''
        user.valid?
        expect(user.errors.full_messages).to include("Name can't be blank")
      end

      it 'emailが空では登録できない' do
        user.email = ''
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが他のユーザーと重複していると登録できない' do
        # 既存ユーザーをFactoryBotで作成
        FactoryBot.create(:user, email: 'test@example.com') # 既存ユーザー作成
        user.email = 'test@example.com' # 重複したemailを設定
        user.valid?
        expect(user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailには「@」を含む必要がある' do
        user.email = 'testexample.com' # 「@」が含まれていない
        user.valid?
        expect(user.errors.full_messages).to include('Email is invalid') # 修正したエラーメッセージに変更
      end

      it 'passwordが空では登録できない' do
        user.password = ''
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが半角数字のみの場合は登録できない' do
        user.password = '123456' # 数字のみ
        user.password_confirmation = '123456'
        user.valid?
        expect(user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'passwordが半角英字のみの場合は登録できない' do
        user.password = 'password' # 英字のみ
        user.password_confirmation = 'password'
        user.valid?
        expect(user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'passwordが全角の場合は登録できない' do
        user.password = 'パスワード' # 全角文字
        user.password_confirmation = 'パスワード'
        user.valid?
        expect(user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'passwordとpassword_confirmationが異なる場合は登録できない' do
        user.password = 'password123'
        user.password_confirmation = 'password456' # 異なる値を設定
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空では登録できない' do
        user.last_name = ''
        user.valid?
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが全角文字でないと登録できない' do
        user.last_name = 'yamada'
        user.valid?
        expect(user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end

      it 'first_nameが空では登録できない' do
        user.first_name = ''
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが全角文字でないと登録できない' do
        user.first_name = 'taro'
        user.valid?
        expect(user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end

      it 'last_name_furiganaが空では登録できない' do
        user.last_name_furigana = ''
        user.valid?
        expect(user.errors.full_messages).to include("Last name furigana can't be blank")
      end

      it 'last_name_furiganaが全角カタカナでないと登録できない' do
        user.last_name_furigana = 'やまだ'
        user.valid?
        expect(user.errors.full_messages).to include('Last name furigana is invalid. Input full-width katakana characters')
      end

      it 'first_name_furiganaが空では登録できない' do
        user.first_name_furigana = ''
        user.valid?
        expect(user.errors.full_messages).to include("First name furigana can't be blank")
      end

      it 'first_name_furiganaが全角カタカナでないと登録できない' do
        user.first_name_furigana = 'たろう'
        user.valid?
        expect(user.errors.full_messages).to include('First name furigana is invalid. Input full-width katakana characters')
      end

      it 'date_of_birthが空では登録できない' do
        user.date_of_birth = ''
        user.valid?
        expect(user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end
