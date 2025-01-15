

# テーブル設計

## users テーブル

| Column                        | Type   | Options     |
| ----------------------------- | ------ | ----------- |
| nickname                      | string | null: false |
| email                         | string | null: false, unique: true |
| encrypted_password            | string | null: false |
| first_name                    | string | null: false |
| last_name                     | string | null: false |
| date_of_birth                 | date   | null: false |


### Association
has_many :items
has_many :orders



## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item_name          | string     | null: false |
| item_description   | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| shipping_fee_id    | integer    | null: false |
| shipping_origin_id | integer    | null: false |
| shipping_days_id   | integer    | null: false |
| price              | integer    | null: false |
| user               | referenses | null: false,foreign_key: true |


### Association
belongs_to :users
has_one :orders

## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | referenses | null: false,foreign_key: true |
| item               | referenses | null: false,foreign_key: true |


### Association

belongs_to :users
belongs_to :items
has_one :addresses


## addresses テーブル

| Column                           | Type       | Options     |
| -------------------------------- | ---------- | ----------- |
| encrypted_card_number            | string     | null: false |
| encrypted_card_expiry_date       | string     | null: false |
| encrypted_security_code          | string     | null: false |
| post_code                        | string     | null: false |
| prefecture_id                    | string     | null: false |
| city_ward_town_village           | string     | null: false |
| street_address                   | string     | null: false |
| building_name                    | string     | null: false |
| encrypted_phone_number           | string     | null: false |
| user                             | referenses | null: false,foreign_key: true |
| item                             | referenses | null: false,foreign_key: true |




### Association

belongs_to :order