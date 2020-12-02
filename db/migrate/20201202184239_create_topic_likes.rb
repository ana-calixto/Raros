class CreateTopicLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :topic_likes do |t|
      t.integer :like_count
      t.references :topic, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
