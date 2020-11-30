class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?



  def home
  end

  def index
      @users = User.all

      # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
      @markers = @users.geocoded.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude
        }
      end
    end
end
