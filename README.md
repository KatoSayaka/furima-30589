# usersテーブル

| Column                | Type   | Option      |  
| --------------------- | --------｜------------｜
| nick_name             | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| first_name            | string  | null: false |
| last_name             | string  | null: false |
| first_name2           | string  | null: false |
| last_name2            | string  | null: false |
| birthday              | integer | null: false |

### Association
- has_many :items
- has_many :purchases

# itemsテーブル

| Column        | Type       | Option            |  
| --------------| -----------｜------------------｜
| image         |            |
| item          | string     | null: false       |
| item_describe | string     | null: false       |
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
| credit_num    | integer    | null: false       |
| expiration    | integer    | null: false       |
| security_code | integer    | null: false       |
| postal_cod    | integer    | null: false       |
| city          | string     | null: false       |
| address_num   | integer    | null: false       |
| phone         | integer    | null: false       |
| user          | references | foreign_key: true |
| item          | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item