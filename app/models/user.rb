class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ニックネーム
  validates :nickname, presence: true

  # メールアドレス (デフォルトのDeviseのバリデーションが適用されます)
  validates :email, presence: true, uniqueness: true

  # パスワード
  validates :password, presence: true, length: { minimum: 6 }

  # 名前
  validates :last_name, presence: true
  validates :first_name, presence: true

  # 名前カナ
  validates :last_name_furigana, presence: true
  validates :first_name_furigana, presence: true

  # 生年月日
  validates :date_of_birth, presence: true
end
