# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last-name          | string  | null: false |
| first-name         | string  | null: false |
| last-name-kana     | string  | null: false |
| first-name-kana    | string  | null: false |
| birth-date         | date    | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                     | Type   | Options     |
| -------------------------- | ------ | ----------- |
| item-image                 | text   | null: false |
| item-name                  | string | null: false |
| item-info                  | text   | null: false |
| item-category              | string | null: false |
| item-sales-status          | string | null: false |
| item-shopping-fee-status   | string | null: false |
| item-prefecture            | string | null: false |
| item-scheduled-delivery    | string | null: false |
| item-price                 | integr | null: false |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user-id   | references | null: false, foreign_key: true |
| item-id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping-address

## shipping-addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| order-id     | reference  | null: false, foreign_key: true |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| adresses     | string     | null: false                    |
| building     | string     |                                |
| phone-number | integer    | null: false                    |

### Association

- belongs_to :order

