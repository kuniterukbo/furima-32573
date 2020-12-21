# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| encrypted_password   | string | null: false |
| family_name          | string | null: false |
| first_name           | string | null: false |
| family_name_katakana | string | null: false |
| first_name_katakana  | string | null: false |
| birthday             | string | null: false |

### Association

- has_many :items
- has_many :credit_cards
- has_many :comments

## items テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| image               |         |             |
| product_name        | string  | null: false |
| product_explanation | text    | null: false |
| category            | string  | null: false |
| product_state       | string  | null: false |
| shipping_charges    | string  | null: false |
| delivery_source     | string  | null: false |
| delivery_date       | string  | null: false |
| selling_price       | integer | null: false |

### Association

- belongs_to :user
- has_one :credit_card
- has_many :comments

## credit_card テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| card_number | string     | null: false |
| month       | string     | null: false |
| year        | string     | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_address テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefectures   | string  | null: false |
| municipality  | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| phone_number  | string  | null: false |

### Association

- belongs_to :credit_card

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item