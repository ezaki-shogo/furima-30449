# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| birthday        | integer | null: false |
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
- has_one :addreses

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| description  | text       | null: false                    |
| category_id  | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| price        | integer    | null: false                    |
| condition_id | integer    | null: false                    |


### Association

- belongs_to :purchases
- belongs_to :user

## addreses テーブル


| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| prefecture_id   | integer    | null: false                    |
| sipping_days_id | text       | null: false                    |
| postnumber      | integer    | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     | null: false                    |
| phone_number    | integer    | null: false                    |
| purchases       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases