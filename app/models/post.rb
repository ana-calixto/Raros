class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  validates :content, length: { minimum: 10 }
end
