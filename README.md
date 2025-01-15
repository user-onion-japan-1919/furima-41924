

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
| prefecture_id      | integer    | null: false |
| shipping_day_id    | integer    | null: false |
| price              | integer    | null: false |
| user               | referenses | null: false,foreign_key: true |


### Association
belongs_to :users
has_one :orders

## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| order              | referenses | null: false,foreign_key: true |


### Association

belongs_to :users
belongs_to :items
has_one :addresses


## addresses テーブル

| Column                           | Type       | Options     |
| -------------------------------- | ---------- | ----------- |
| post_code                        | string     | null: false |
| prefecture_id                    | integer    | null: false |
| city_ward_town_village           | string     | null: false |
| street_address                   | string     | null: false |
| building_name                    | string     |             |
| phone_number                     | string     | null: false |
| user                             | referenses | null: false,foreign_key: true |
| item                             | referenses | null: false,foreign_key: true |




### Association

belongs_to :order