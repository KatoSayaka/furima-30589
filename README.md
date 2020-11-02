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

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
=======
# usersテーブル

| Column             | Type   | Option      |  
| ------------------ | -------｜------------｜
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :orders

# itemsテーブル

| Column          | Type       | Option            |  
| ----------------| -----------｜------------------｜
| item_image      |            | null: false
| item_name       | string     | null: false       |
| item_info       | text       | null: false       |
| category_id     | integer    | null: false       |
| item_state_id   | integer    | null: false       |
| shipping_fee_id | integer    | null: false       |
| prefecture_id   | integer    | null: false       |
| shipping_day_id | integer    | null: false       |
| price           | integer    | null: false       |
| user            | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :order

# ordersテーブル

| Column        | Type       | Option            |  
| --------------| ---------- ｜------------------｜
| user          | references | foreign_key: true |
| item          | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

# addressテーブル

| Column        | Type       | Option            |  
| --------------| ---------- ｜------------------｜
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| address_num   | string     | null: false       |
| building_name | string     |                   |
| phone         | string     | null: false       |
| order         | references | foreign_key: true |

### Association
- belongs_to :order
