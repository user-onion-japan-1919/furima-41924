# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ニックネーム
  validates :nickname, presence: true

  # メールアドレス
  validates :email, presence: true, uniqueness: true

  # パスワード (英数字混合)
  validates :password, presence: true, length: { minimum: 6 },
                       format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'is invalid. Include both letters and numbers' }

  # 名前 (全角文字)
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龯々ー]+\z/, message: 'is invalid. Input full-width characters' }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ン一-龯々ー]+\z/, message: 'is invalid. Input full-width characters' }

  # 名前カナ (全角カタカナ)
  validates :last_name_furigana, presence: true,
                                 format: { with: /\A[ァ-ンー]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :first_name_furigana, presence: true,
                                  format: { with: /\A[ァ-ンー]+\z/, message: 'is invalid. Input full-width katakana characters' }

  # 生年月日
  validates :date_of_birth, presence: true
end
