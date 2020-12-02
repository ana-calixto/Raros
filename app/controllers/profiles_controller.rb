class ProfilesController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow, :show]

  def show
    #@followers
    @followings= current_user.following_ids.map do |id|
      User.find(id)
    end
    raise
  end

  def follow
    current_user.follow(params[:id])
    redirect_back
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_back
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
