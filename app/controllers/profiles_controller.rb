class ProfilesController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow]

  def index
    @users = User.where.not(id: current_user.id)
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
