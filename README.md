## users テーブル
| Column              | Type   | Options                  |
| ------------------- | ------ | ------------------------ |
| nickname            | string | null: false, index: true |
| email               | string | null: false              |
| encrypted_password  | string | null: false              |
| profile             | text   | null: false |
| art_style           | text   | null: false |
| influenced_by       | text   |    |

### Association
- has_many :portfolios
- has_many :comments

## Portfolios テーブル
| Column      | Type      | Options           |
| ---------  | ---------- | ----------------- |
| title      | string     | null: false|
| catch_copy | text       | null: false|
| concept    | text       | null: false|
| image      | ActiveStorageで実装|
| youtube    | text       |       
| soundcloud | text       |
| user       | references | 

### Association
- belongs_to :user
- has_many :comments

## comments テーブル
| Column   | Type      | Options     |
| -------- | ------    | ----------- |
| text     | text      | null: false |
| user     | references| |
| Portfolio| references|  |

- belongs_to :user
- belongs_to :Portfolio
