<<<<<<< HEAD
# README
=======
>>>>>>> master
# usersテーブル

| Column             | Type   | Option      |  
| ------------------ | -------｜------------｜
<<<<<<< HEAD
| nickname           | string | null: false |
=======
| nick_name          | string | null: false |
>>>>>>> master
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :purchases

# itemsテーブル

| Column          | Type       | Option            |  
| ----------------| -----------｜------------------｜
| item            | string     | null: false       |
| item_describe   | text       | null: false       |
| category_id     | integer    | null: false       |
| item_state_id   | integer    | null: false       |
| shipping_fee_id | integer    | null: false       |
| prefecture_id   | integer    | null: false       |
| shipping_day_id | integer    | null: false       |
| price           | integer    | null: false       |
| user            | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

# purchasesテーブル

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
| purchase      | references | foreign_key: true |

### Association
- belongs_to :purchase