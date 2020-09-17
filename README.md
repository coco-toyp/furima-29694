# README

# テーブル設計

## users テーブル

| Column          | Type      | Options     |
| --------        | ------    | ----------- |
| nickname        | string    | null: false |
| email           | string    | null: false |
| password        | string    | null: false |
| name            | string    | null: false |
| kananame        | string    | null: false |
| birthday        | date      | null: false |

### Association

- has_many :goods
- has_many :comments

## goods テーブル

| Column          | Type      | Options     |
| --------        | ------    | ----------- |
| name            | string    | null: false |
| description     | text      | null: false |
| category        | string    | null: false |
| status          | string    | null: false |
| shipping_bill   | string    | null: false |
| shipping_area   | string    | null: false |
| shipping_date   | string    | null: false |
| price           | integer   | null: false |
| fee             | integer   | null: false |
| benefit         | integer   | null: false |


### Association

- belongs_to :users
- has_many :comments
- has_one :buyings

## comments テーブル

| Column  | Type       | Options         |
| ------  | ---------- | --------------- |
| content | text       | null: false     |


### Association

- belongs_to :users
- belongs_to :goods

## buyings テーブル

| Column          | Type      | Options     |
| --------        | ------    | ----------- |
| card_number     | integer   | null: false |
| card_limit      | date      | null: false |
| cvv             | integer   | null: false |
| postal          | integer   | null: false |
| prefecture      | string    | null: false |
| city            | string    | null: false |
| adress          | text      | null: false |
| call            | integer   | null: false |

### Association

- has_one :goods
