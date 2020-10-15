# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| birthday        | date    | null: false |
| full_first_name | string  | null: false |
| full_last_name  | string  | null: false |
| half_first_name | string  | null: false |
| half_last_name  | string  | null: false |

### Association

- has_many :items
- has_many :purchases

## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| price           | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| sipping_fee_id  | integer    | null: false                    |
| sipping_area_id | integer    | null: false                    |
| sipping_days_id | integer    | null: false                    |

### Association

- belongs_to :purchase
- belongs_to :user

## addresses テーブル


| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| prefecture_id   | integer    | null: false                     |
| postnumber      | string     | null: false                     |
| municipality    | string     | null: false                     |
| address         | string     | null: false                     |
| building        | string     |                                 |
| phone_number    | string     | null: false                     |
| purchase        | references  | null: false, foreign_key: true |

### Association

- belongs_to :purchase
