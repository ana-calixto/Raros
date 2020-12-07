class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_user, only: [:show]
  before_action :set_chatrooms, only: [:index, :search]

  def show
    @topics = Topic.where(user_id: params[:id])
    @age = Date.today.year - current_user.birth_date.year if current_user
  end

  def home
  end

  def index
    @age = Date.today.year - current_user.birth_date.year if current_user
    @users = User.all
    #the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @users.where(disease: current_user.disease).geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user })
      }
    end
  end

  def search
    if params[:query].present?
      @results = PgSearch.multisearch(params[:query])
    else
      @results = User.all
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
