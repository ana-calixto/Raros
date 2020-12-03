class AddUsersToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :user, foreign_key: true
    add_column :chatrooms, :author_id, :integer
  end
end
