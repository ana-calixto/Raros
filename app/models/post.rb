class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user, through: :topic
  validates :content, length: { minimum: 20 }
end
