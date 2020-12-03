class AddDiseaseToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :disease, null: false, foreign_key: true
  end
end
