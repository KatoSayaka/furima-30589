# usersテーブル

| Column             | Type   | Option      |  
| ------------------ | -------｜------------｜
| nick_name          | string | null: false |
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

| Column        | Type       | Option            |  
| --------------| -----------｜------------------｜
| item          | string     | null: false       |
| item_describe | text       | null: false       |
| category      | string     | null: false       |
| item_state    | string     | null: false       |
| shipping_fee  | string     | null: false       |
| ship-from     | string     | null: false       |
| shipping_day  | string     | null: false       |
| user          | references | foreign_key: true |

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
| city          | string     | null: false       |
| address_num   | string     | null: false       |
| phone         | string     | null: false       |
| purchase      | references | foreign_key: true |

### Association
- belongs_to :purchase