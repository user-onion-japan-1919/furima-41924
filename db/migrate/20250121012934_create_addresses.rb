class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
        t.string  :post_code, null: false            # 郵便番号
        t.integer :prefecture_id, null: false          # 都道府県（ActiveHashを使用する場合）
        t.string  :city_ward_town_village, null: false                  # 市区町村
        t.string  :street_address, null: false          # 番地
        t.string  :building_name                     # 建物名（任意）
        t.string  :phone_number, null: false          # 電話番号
        t.references :order, null: false, foreign_key: true # 購入履歴との関連付け
      t.timestamps
    end
  end
end
