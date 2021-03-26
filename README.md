## アプリケーション名
CreConne(クリコネ)

## アプリケーション概要
クリエイターとクリエイターを繋げるプラットフォームです

## 概要
作品投稿機能、ユーザー管理機能、コメント機能、フォロー機能、DM機能、作品検索機能があります。

# DEMO
## トップページ
![トップページ](https://user-images.githubusercontent.com/73812599/112564262-4869fa00-8e1e-11eb-90ea-b7dd53a8c436.png)
![トップページ２](https://user-images.githubusercontent.com/73812599/112565861-45243d80-8e21-11eb-8106-e24ab21838f7.png)
![トップページ３](https://user-images.githubusercontent.com/73812599/112564635-f8d7fe00-8e1e-11eb-8bdd-e0323e33a3fd.png)

## 作品詳細ページ
![作品ページ](https://user-images.githubusercontent.com/73812599/112565111-d5618300-8e1f-11eb-89bf-22aa5cc687f1.png)

## ユーザーページ
![ユーザーページ１](https://user-images.githubusercontent.com/73812599/112564812-47859800-8e1f-11eb-9573-1feab722b9ee.png)
![ユーザーページ２](https://user-images.githubusercontent.com/73812599/112564843-5704e100-8e1f-11eb-851b-ca146c012bd6.png)

## Youtube機能
![youtube機能](https://user-images.githubusercontent.com/73812599/112564883-66842a00-8e1f-11eb-918b-82bb7c15bf55.png)

## DM機能
![DM機能](https://user-images.githubusercontent.com/73812599/112565007-a2b78a80-8e1f-11eb-9f87-03b6b1b06f10.png)

## 検索機能
![検索機能](https://user-images.githubusercontent.com/73812599/112565282-23768680-8e20-11eb-8795-d150b9298eca.png)




# 使用技術
## バックエンド
Ruby,Ruby on Rails

## フロントエンド
Bootstrap
Javascript
Saas
JQuery
Ajax

## データベース
MySQL,SequelPro

## ソース管理
Github,Github Desktop

## エディタ
VSCode


# 制作背景(意図)
私自身がミュージシャン、カメラマンとして活動していた経歴があり、その時の経験を元に作成しました。
ミュージシャンが曲を作り、世の中に発信する為にはアーティスト写真を撮る為のカメラマン、CDジャケットのデザインをするイラストレーター、ミュージックビデオを作成するビデオクリエイターなど、様々なクリエイターの力が必要になります。
しかし、事務所に所属していないフリーのクリエイターは自分と違うジャンルのクリエイターと繋がる機会が少ないのが現状です。
同様にカメラマンとして活動していた時も同じような課題で悩んでいました。
もっと多くのクリエイターと繋がることができれば、もっと多くの作品を生み出せる。
自分がもつ世界観と他のクリエイターの世界観、それらが合わさることにより新たな可能性を生み出すことができる。
そんな場所があればと思いCreaterとCreaterをConnectするCreConne（クリコネ）を制作しました。

## 工夫したポイント
イラストレーターや写真家は作品を画像で投稿できるが、ミュージシャンやビデオクリエイターなどは画像で作品を表現することができません。そこでYoutubeの埋め込みを可能にする実装を施しました。ユーザーはyoutubeの共有リンク下11桁を入力するだけでyoutubeの埋め込みが可能になります。
また、creconneのロゴも自分で制作いたしました。

## 課題や今後実装したい機能
s3の実装、いいね機能、ビューの改善(特にチャット画面)
より詳細な検索機能の実装

# DB設計

## users テーブル
| Column              | Type   | Options                  |
| ------------------- | ------ | ------------------------ |
| nickname            | string | null: false, index: true |
| email               | string | null: false              |
| encrypted_password  | string | null: false              |
| profile             | text   | null: false |
| art_style           | text   | null: false |
| influenced_by       | text   |    |
| image               | ActiveStorageで実装||
### Association
- has_many :portfolios
- has_many :comments

## Portfolios テーブル
| Column      | Type      | Options           |
| ---------  | ---------- | ----------------- |
| title      | string     | null: false|
| catch_copy | text       | null: false|
| concept    | text       | null: false|
| image      | ActiveStorageで実装||
| youtube    | text       |       |
| soundcloud | text       ||
| genre_id   | integer    ||
| user       | references |  foreign_key: true|

### Association
- belongs_to :user
- has_many :comments

## comments テーブル
| Column   | Type      | Options     |
| -------- | ------    | ----------- |
| text     | text      | null: false |
| user     | references| foreign_key: true||
| Portfolio| references| foreign_key: true| |

- belongs_to :user
- belongs_to :Portfolio
