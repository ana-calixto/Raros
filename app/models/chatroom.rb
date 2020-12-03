class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :user, dependent: :destroy
  belongs_to :author, class_name: "User", dependent: :destroy
end
