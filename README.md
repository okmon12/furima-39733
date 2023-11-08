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
| category                | text    | null: false                       |
| product_description     | text    | null: false                       |
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
- belongs_to :shipping


## shippings テーブル

| Column                  | Type         | Options                        |
| ------------------------| ------------ | ------------------------------ |
| shipping_city_id        | string       | null: false                    |
| shipping_street_id      | string       | null: false                    |
| shipping_prefecture_id  | string       | null: false                    |
| shipping_building_id    | string       |                                |
| shipping_phone_id       | string       | null: false                    |
| shipping_postal_code_id | string       | null: false                    |
| buyers                  | string       | null: false                              |      |


### Association
- belongs_to :buyer

