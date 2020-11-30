class Disease < ApplicationRecord
  has_many :users, through: :history
end
