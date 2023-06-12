class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '音楽' },
    { id: 3, name: 'イラスト' },
    { id: 4, name: '写真' },
    { id: 5, name: '映像' },
    { id: 7, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :portfolios
  end