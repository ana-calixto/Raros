class ProfilesController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow, :show]

  def show
    # @followers = Follower.all
    # @followings = current_user.following_ids.map do |id|
    #   User.find(id)
    # end
    @topics = Topic.where(user_id: params[:id])
  end

  def follow
    current_user.follow(params[:id])
    redirect_to profile_path(@user.id)
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_to profile_path(@user.id)
  end

  private

  def set_user  
    @user = User.find(params[:id])
  end
end