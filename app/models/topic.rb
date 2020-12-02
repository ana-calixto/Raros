class Topic < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :topic_likes, dependent: :destroy
end
