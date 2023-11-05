## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| nick name          | string | null: false |
| encrypted_password | string | null: false |
| date_of_birth      | string | null: false |

### Association
- has_many :items
- has_many :buyers
- has_one :shipping
## items テーブル

| Column               | Type   | Options                            |
| -------------------- | ------  | ----------------------------------|
| product_name         | string  | null: false                       |
| category             | text    | null: false                       |
| product_description  | text    | null: false                       |
| product_condition    | text    | null: false                       |
| category             | text    | null: false                       |
| price                | decimal | null: false                       |
| delivery_time        | string  | null: false                       |
| origin_location      | string  | null: false                       |
| shipping_fee         | decimal | null: false                       |
| user                 | references | null: false, foreign_key: true |
| buyer                | references | null: false, foreign_key: true |

### Association
- belongs_to :buyers
- belongs_to :user


## buyers テーブル

| Column       | Type       | Options                           |
| ------------ | ---------- | --------------------------------- |
| user         | references |  null: false, foreign_key: true   |
| product_name | references |  null: false, foreign_key: true   |
| shipping     | references |  null: false, foreign_key: true   |

### Association
- has_many :items
- belongs_to :user
- belongs_to :shipping


## shippings テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| shipping_city        | text       | null: false                    |
| shipping_street      | text       | null: false                    |
| shipping_prefecture  | text       | null: false                    |
| shipping_building    | text       | null: false                    |
| shipping_phone       | text       | null: false                    |
| shipping_postal_code | text       | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
- has_many :buyers
- belongs_to :user
