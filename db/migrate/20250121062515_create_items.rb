class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description
      t.integer :price, null: false
      t.boolean :sold_out, default: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
