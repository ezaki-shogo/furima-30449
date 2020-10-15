# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite
- belongs_to :user
- belongs_to :item
- has_one :address

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
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
