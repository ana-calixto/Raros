class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]
  before_action :set_user, only: [:show]

  def show
    @topics = Topic.where(user_id: params[:id])
  end

  def home
  end

  def index
    @users = User.all
    #the `geocoded` scope filters only users with coordinates (latitude & longitude)
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
