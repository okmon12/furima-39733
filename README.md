## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| first_name         | string | null: false               |
| email              | string | null: false, unique: true |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| birthdate          | date   | null: false               |
| last_name          | string | null: false               |
| first_kana         | string | null: false               |
| last_kana          | string | null: false               |

### Association
- has_many :items
- has_many :buyers


## items テーブル

| Column                  | Type    | Options                           |
| ----------------------  | ------- | ----------------------------------|
| product_name            | string  | null: false                       |
| category_id             | integer | null: false                       |
| product_description     | text    | null: false                       |
| product_condition_id    | integer | null: false                       |
| price                   | integer | null: false                       |
| shipping_address_form_id| integer | null: false                       |
| origin_location_id      | integer | null: false                       |
| shipping_fee_id         | integer | null: false                       |
| user                    | references | null: false, foreign_key: true |

### Association
- has_one :buyer
- belongs_to :user


## buyers テーブル

| Column       | Type       | Options                           |
| ------------ | ---------- | --------------------------------- |
| user         | references |  null: false, foreign_key: true   |
| item         | references |  null: false, foreign_key: true   |

### Association
- belongs_to :item
- belongs_to :user
- has_one :shipping


## shippings テーブル

| Column                  | Type         | Options                        |
| ------------------------| ------------ | ------------------------------ |
| shipping_address_form_id| integer      | null: false                    |
| shipping_city           | string       | null: false                    |
| shipping_street         | string       | null: false                    |
|   shipping_building     | string       |                                |
| shipping_phone          | string       | null: false                    |
| shipping_postal_code    | string       | null: false                    |
| buyer                   | references   | null: false, foreign_key:true |


### Association
- belongs_to :buyer


