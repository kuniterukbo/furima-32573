# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| family_name          | string | null: false |
| first_name           | string | null: false |
| family_name_katakana | string | null: false |
| first_name_katakana  | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many :purchase_histories
- has_many :items
- has_many :comments

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| product_explanation | text       | null: false                    |
| category_id         | integer    | null: false                    |
| product_state_id    | integer    | null: false                    |
| shipping_charge_id  | integer    | null: false                    |
| delivery_source_id  | integer    | null: false                    |
| delivery_date_id    | integer    | null: false                    |
| selling_price       | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- has_one :purchase_history
- belongs_to :user
- has_many :comments

## purchase_histories テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_addresses テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postal_code       | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| municipality      | string     | null: false                    |
| address           | string     | null: false                    |
| building_name     | string     |                                |
| phone_number      | string     | null: false                    |
| purchase_history  | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_history

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item