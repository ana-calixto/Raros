class Disease < ApplicationRecord
  has_many :users
  include PgSearch::Model
  multisearchable against: [:name, :cid_10]
end
