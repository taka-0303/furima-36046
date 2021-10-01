## usersテーブル

| Column            | Type   | Option                    |
| ----------------- | ------ | ------------------------- |
| email             | string | null: false, unique: true |
| encrypted_password| string | null: false               |
| nickname          | string | null: false               |
| last_name         | string | null: false               |
| first_name        | string | null: false               |
| last_name_read    | string | null: false               |
| first_name_read   | string | null: false               |
| birth_day         | data   | null: false               |

### Association
has_many :items
has_many :purchases

## itemsテーブル

| Column        | Type       | Option                        |
| ------------- | ---------- | ----------------------------- |
| item_name     | string     | null: false                   |
| text          | text       | null: false                   |
| category_id   | integer    | null: false                   |
| condition_id  | integer    | null: false                   |
| Commission_id | integer    | null: false                   |
| area_id       | integer    | null: false                   |
| delivery_id   | integer    | null: false                   |
| price         | integer    | null: false                   |
| user          | references | null: false, foreign_key: true|

### Association
belongs_to :user
has_one :purchase

## purchaseテーブル

| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :shipping_info

## shipping_infoテーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| Postal_code      | string     | null: false                    |
| area_id          | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association
belongs_to :purchase