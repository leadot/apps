class UsersController < ApplicationController
  before_action :load_user, only: [ :edit, :create, :show, :update]
  before_action :authenticate_user!
  before_action :get_neighborhood, only: [:create]


    def index
        @users = User.all
      end

    def new
      @user = User.new
    end

    def edit
    end

    # def create
    #   #@user = User.create(street: "whetaver", city: "City", State: "State", postal_code: "Postal Code", neighboorhood: "Wagener")
    #   #@location = Location.find_or_create_by(params[:address])@user = User.new(user_params)
    #   @user = User.new(user_params)
    #   neighborhood = get_neighborhood(user_params[:latitude],user_params[:longitude])
    #   neighborhood_id = 2 #Neighborhood.find_by(name: neighborhood)[:id]
    #
    #   if @user.save!
    #   binding.pry
    #   @user.update_attribute(:neighborhood_id, neighborhood_id)
    #   redirect_to neighborhood_incidents_path(neighborhood_id, @incidents), notice:"Great! Now let's find your neighborhood!"
    #   else
    #   render new, notice:"Oops, something went wr ong! Try again!"
    #   end
    # end

    def update
      if params[:address].present?
       @user = User.geolocate(params[:address])
      respond_to do |format|
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully created.'
      else
        flash[:error]  = "Oops! We couldn't update the user, please review the errors"
        render :edit
      end
      end
    end
  end

    def show
    end

private

  def load_user
    @user = User.find(params[:id])
  end
  #
  # def get_neighborhood(lat, lon)
  #   require 'http'
  #
  #   url = URI.parse("https://maps.googleapis.com/maps/api/geocode/json?latlng=#{lat},#{lon}&key=AIzaSyDYx7xwDQTH_giQcHYjPKS1pK0CpHSplug")
  #   res = HTTP.get(url)
  #   data = JSON.parse(res.body)
  #   data['results'][0]['address_components'].each do |component|
  #     if component['types'][0] == 'neighborhood'
  #       return component["long_name"]
  #     else
  #       return 'not_found'
  #     end
  #   end
  # end


  def user_params
    params.require(:user).permit(:street, :city, :state, :address, :neighborhood_id, :latitude, :longitude, :first_name, :last_name)
  end
end
