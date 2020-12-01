class RemoveHistories < ActiveRecord::Migration[6.0]
  def change
    drop_table :histories
  end
end
