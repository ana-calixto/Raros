class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]
  before_action :set_user, only: [:show]
  before_action :set_chatrooms, only: [:index, :search]

  def show
    @topics = Topic.where(user_id: params[:id])
  end

  def home
  end

  def index
    @users = User.all
 
    #the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def search
    if params[:query].present?
      @users = User.joins(:disease).where("diseases.name ILIKE ?", "%#{params[:query]}%")
    else
      @users = User.all
    end

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
  
  def set_chatrooms
    @my_chatrooms = Chatroom.all.where(author: current_user)
    @chatrooms = Chatroom.all.where(user_id: current_user)
  end
end
