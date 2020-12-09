class FollowersController < ApplicationController
  def index
    @followers = current_user.followers
    @followings = current_user.following_ids.map do |id|
      User.find(id)
    end
  end
end
