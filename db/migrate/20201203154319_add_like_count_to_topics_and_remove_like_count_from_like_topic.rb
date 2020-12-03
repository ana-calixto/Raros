class AddLikeCountToTopicsAndRemoveLikeCountFromLikeTopic < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :like_count, :integer, default: 0
    remove_column :topic_likes, :like_count

    add_column :posts, :like_count, :integer, default: 0
    remove_column :post_likes, :like_count
  end
end
