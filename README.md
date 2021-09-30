## usersテーブル

| Column            | Type   | Option      |
| ----------------- | ------ | ----------- |
| email             | string | null: false |
| encrypted_password| string | null: false |
| nickname          | string | null: false |
| last_name         | string | null: false |
| first_name        | string | null: false |
| last_name_read    | string | null: false |
| first_name_read   | string | null: false |
| birth_year        | integer| null: false |
| birth_month       | integer| null: false |
| birth_day         | integer| null: false |

### Association
has_many :items
has_many :purchase

## itemsテーブル

| Column     | Type       | Option      |
| ---------- | ---------- | ----------- |
| image      |            |             |
| item_name  | string     | null: false |
| text       | text       | null: false |
| category   | integer    | null: false |
| condition  | integer    | null: false |
| area       | integer    | null: false |
| delivery   | integer    | null: false |
| price      | integer    | null: false |
| user       | references |             |

### Association
belongs_to :user
has_one :purchase

## purchaseテーブル

| Column     | Type       | Option      |
| ---------- | ---------- | ----------- |
| user       | references |             |
| item       | references |             |

### Association
belongs_to :user
belongs_to :item
has_one :shipping_info

## shipping_infoテーブル

| Column           | Type       | Option      |
| ---------------- | ---------- | ----------- |
| Postal_code      | string     | null: false |
| area             | integer    | null: false |
| municipalities   | string     | null: false |
| address          | string     | null: false |
| building_name    | string     |             |
| telephone_number | string     | null: false |
| purchase         | references |             |
### Association
belongs_to :purchase