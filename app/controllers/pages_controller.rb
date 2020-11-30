class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :index ]


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
end
