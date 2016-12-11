class UsersController < ApplicationController
  before_action :load_user, only: [ :edit, :create, :show, :update]
  before_action :authenticate_user!
  #before_action :geolocate_user, only: [:update]
  #efore_action :geolocate_user, only: [ :update]

    def index
        @users = User.all
      end

    def new
      @user = User.new
    end

    def edit
    end

    def create
      #@user = User.create(street: "whetaver", city: "City", State: "State", postal_code: "Postal Code", neighboorhood: "Wagener")
      @user = User.new(user_params)
      if @user.save!
      redirect_to edit_user_url, notice:"Great! Now let's find your neighborhood!"
      else
      render new, notice:"Oops, something went wrong! Try again!"
      end
    end

    def update
      if params[:address].present?
 +      @user = User.geolocate(params[:address])
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

  def user_params
    params.require(:user).permit(:street, :city, :state, :address, :neighborhood_id, :latitude, :longitude, :first_name, :last_name)
  end


end
