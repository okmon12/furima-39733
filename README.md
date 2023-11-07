## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| first_name         | string | null: false |
| email              | string | null: false |
| nick name          | string | null: false |
| encrypted_password | string | null: false |
| birthdate          | date   | null: false |
| last_name          | string | null: false |
| first_kana         | string | null: false |
| last_kana          | string | null: false |

### Association
- has_many :items
- has_many :buyers
- has_one :shipping


## items テーブル

| Column                  | Type    | Options                           |
| ----------------------  | ------- | ----------------------------------|
| product_name_id         | string  | null: false                       |
| category                | text    | null: false                       |
| product_description_id  | text    | null: false                       |
| product_condition_id    | text    | null: false                       |
| price_id                | decimal | null: false                       |
| shipping-address-form_id| string  | null: false                       |
| origin_location_id      | string  | null: false                       |
| shipping_fee_id         | decimal | null: false                       |
| user                    | references | null: false, foreign_key: true |

### Association
- has_many : buyers
- belongs_to :user


## buyers テーブル

| Column       | Type       | Options                           |
| ------------ | ---------- | --------------------------------- |
| user         | references |  null: false, foreign_key: true   |
| item         | references |  null: false, foreign_key: true   |

### Association
- belongs_to :item
- belongs_to :user
- has_many :shippings


## shippings テーブル

| Column               | Type         | Options                        |
| -------------------- | ------------ | ------------------------------ |
| shipping_city        | string       | null: false                    |
| shipping_street      | string       | null: false                    |
| shipping_prefecture  | string       | null: false                    |
| shipping_building    | string       | null: false                    |
| shipping_phone       | string       | null: false                    |
| shipping_postal_code | string       | null: false                    |
| user                 | references   | null: false, foreign_key: true |

### Association
- belongs_to :buyer
- belongs_to :user
