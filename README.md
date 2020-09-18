# README

# テーブル設計

## users テーブル

| Column          | Type      | Options     |
| --------        | ------    | ----------- |
| nickname        | string    | null: false |
| email           | string    | null: false |
| password        | string    | null: false |
| first_name      | string    | null: false |
| last_name       | string    | null: false |
| first_kananame  | string    | null: false |
| last_kananame   | string    | null: false |
| birthday        | date      | null: false |

### Association

- has_many :goods
- has_many :purchases

## goods テーブル

| Column          | Type      | Options     |
| --------        | ------    | ----------- |
| name            | string    | null: false |
| description     | text      | null: false |
| category        | string    | null: false |
| status          | integer   | null: false |
| shipping_bill   | integer   | null: false |
| shipping_area   | integer   | null: false |
| shipping_date   | integer   | null: false |
| price           | integer   | null: false |



### Association

- belongs_to :user
- has_one :purchase



## profiles テーブル

| Column          | Type      | Options     |
| --------        | ------    | ----------- |
| postal          | string    | null: false |
| todofuken       | integer   | null: false |
| city            | string    | null: false |
| adress          | text      | null: false |
| call            | string    | null: false |
| building        | string    |             |

### Association

- has_one :purchase

## purchase テーブル

| Column          | Type      | Options                      |
| --------        | ------    | -----------------------------|
| user            | string    | null: false foreign_key: true|
| good            | integer   | null: false foreign_key: true|

### Association

- belongs_to :user
- has_one :profile
- has_one :good

