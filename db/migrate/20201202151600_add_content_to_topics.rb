class AddContentToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :content, :text
  end
end
