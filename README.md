

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| password           | string | null: false |
| nickname           | string | null: false |



### Association


## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item-image         | string     | null: false |
| item-name          | string     | null: false |
| item-description   | string     | null: false |
| item-category      | string     | null: false |
| item-condition     | string     | null: false |
| user               | referenses | null: false,foreign_key: true |


### Association

## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| content            | string     | null: false |
| user               | referenses | null: false,foreign_key: true |
| item               | referenses | null: false,foreign_key: true |


### Association

## purchases テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| price              | text       | null: false |
| fee                | references | null: false,foreign_key: true |
| profit             | references | null: false,foreign_key: true |
| item               | referenses | null: false,foreign_key: true |

### Association

## shipping-addresses テーブル

| Column                  | Type       | Options     |
| ----------------------- | ---------- | ----------- |
| shipping-fee            | text       | null: false |
| shipping-origin-region  | references | null: false,foreign_key: true |
| days-until-shipping     | references | null: false,foreign_key: true |
| item                    | referenses | null: false,foreign_key: true |
