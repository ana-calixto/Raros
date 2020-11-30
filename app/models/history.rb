class History < ApplicationRecord
  belongs_to :disease
  belongs_to :user
end
