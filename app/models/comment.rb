class Comment < ApplicationRecord
  belongs_to :portfolio
  belongs_to :user
end