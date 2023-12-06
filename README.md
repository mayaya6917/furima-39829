# テーブル設計

## users テーブル

| Column             | Type    | Options            |
| ------------------ | ------- | ------------------ |
| nickname           | string  | null: false        |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false        |
| last_name          | string  | null: false        |
| first_name         | string  | null: false        |
| last_name_kana     | string  | null: false        |
| first_name_kana    | string  | null: false        |
| birth_date         | date    | null: false        |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                        | Type   | Options     |
| ----------------------------- | ------ | -----------
| user                          | references | null false, foreign_key: true |
| name                     | string  | null: false |
| info                     | text    | null: false |
| category_id              | integer | null: false |
| sales_status_id          | integer | null: false |
| shopping_fee_status_id   | integer | null: false |
| prefecture_id                 | integer | null: false |
| scheduled_delivery_id    | integer | null: false |
| price                    | integer | null: false |

### Association

- belongs_to :user
- has_one :order
- belongs_to :category_id
- belongs_to :sales_status_id
- belongs_to :shopping_fee_status_id
- belongs_to :prefecture_id
- belongs_to :scheduled_delivery_id

### include ActiveHash::Associations
- belongs :prefecture

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## ShippingAddresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | references  | null: false, foreign_key: true |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false,                   |
| city          | string     | null: false                    |
| adresses      | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

### Association
- belongs_to :order
- belongs_to :prefecture_id

