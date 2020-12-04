class ProfilesController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow, :show]

  def show
    @followers = current_user.followers
    @followings = current_user.following_ids.map do |id|
      User.find(id)
    end
  end

  def follow
    current_user.follow(params[:id])
    redirect_to page_path(@user.id)
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_to page_path(@user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
