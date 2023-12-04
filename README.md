# テーブル設計

## users テーブル

| Column             | Type    | Options            |
| ------------------ | ------- | ------------------ |
| nickname           | string  | null: false        |
| email              | string  | null: false, UNIQUE|
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

| Column                     | Type   | Options     |
| -------------------------- | ------ | ----------- |
| item_name                  | string | null: false |
| item_info                  | text   | null: false |
| item_category              | string | null: false |
| item_sales_status          | string | null: false |
| item_shopping_fee_status   | string | null: false |
| prefecture_id              | integer | null: false, ActiveHash |
| item_scheduled_delivery    | string | null: false |
| item_price                 | integr | null: false |

### Association

- belongs_to :user
- has_one :order

### include ActiveHash::Associations
- belongs :prefecture

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |
| payment_status  | string     | default: "pending"             |
| transaction_id  | string     | null: false, foreign_key: true, ActiveHash        |
| payment_amount  | integer    | null: false, foreign_key: true |
| payment_date    | datetime   |                                |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | reference  | null: false, foreign_key: true |
| prefecture_id | integer    | null: false, foreign_key: true, ActiveHash |
| city          | string     | null: false                    |
| adresses      | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

### Association

- belongs_to :order

### include ActiveHash::Associations
- belongs_to :prefecture



## prefectures テーブル

### include ActiveHash::Associations

- has_many :items
- has_many :shipping_addresses

