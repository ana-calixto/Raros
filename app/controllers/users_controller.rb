class UsersController < ApplicationController
  def index
    @user = User.all
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
  end
end
