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
| user                          | reference | null false, foreign_key: true |
| item_name                     | string  | null: false |
| item_info                     | text    | null: false |
| item_category_id              | integer | null: false, ActiveHash |
| item_sales_status_id          | integer | null: false, ActiveHash |
| item_shopping_fee_status_id   | integer | null: false, ActiveHash |
| prefecture_id                 | integer | null: false, ActiveHash |
| item_scheduled_delivery_id    | integer | null: false, ActiveHash |
| item_price                    | integer | null: false |

### Association

- belongs_to :user
- has_one :order
- belongs_to :item_category_id
- belongs_to :item_sales_status_id
- belongs_to :item_shopping_fee_status_id
- belongs_to :prefecture_id
- belongs_to :item_scheduled_delivery_id

### include ActiveHash::Associations
- belongs :prefecture

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |
| order-info      | integer    | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | reference  | null: false, foreign_key: true |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false, ActiveHash        |
| city          | string     | null: false                    |
| adresses      | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

### Association
- belongs_to :order
- belongs_to :prefecture_id

