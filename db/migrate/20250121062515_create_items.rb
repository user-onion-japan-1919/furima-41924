class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description
      t.integer :price, null: false
      t.boolean :sold_out, default: false
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true    # カテゴリを追加
      t.references :condition, foreign_key: true   # 商品の状態を追加
      t.references :shipping_fee, foreign_key: true # 配送料の負担を追加
      t.references :prefecture, foreign_key: true   # 発送元の地域を追加
      t.references :shipping_day, foreign_key: true  # 発送までの日数を追加
      t.timestamps
    end
  end
end