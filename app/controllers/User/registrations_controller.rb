class User::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]
before_action :load_user, only: [ :edit, :show, :update]
before_action :authenticate_user!
#before_action :get_neighborhood, only: [:create]


  # GET /resource/sign_up
  def new
     super
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end
  def create
    #@user = User.create(street: "whetaver", city: "City", State: "State", postal_code: "Postal Code", neighboorhood: "Wagener")
    #@location = Location.find_or_create_by(params[:address])@user = User.new(user_params)
    super
    #@user = User.new(user_params)

    if @user.save!
      @lat = @user[:latitude]
      @lon = @user[:longitude]
      neighborhood = get_neighborhood
      neighborhood_id = Neighborhood.find_by(name: neighborhood)[:id]
      @user.update_attribute(:neighborhood_id, neighborhood_id)
      # redirect_to neighborhood_incidents_path(neighborhood_id, @incidents), notice:"Great! We found your neighborhood!"
    else
    render new, notice:"Oops, something went wr ong! Try again!"
    end
  end

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
  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :address, :first_name, :last_name, :state, :city, :street, :neighborhood_id, :latitude, :longitude])
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(user)
    super(user)
      if user.neighborhood
        neighborhood_incidents_path(user.neighborhood)
      else
        edit_user_path(user)
      end
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private

    def load_user
      @user = User.find(params[:id])
    end

    def get_neighborhood
      require 'http'
      url = URI.parse("https://maps.googleapis.com/maps/api/geocode/json?latlng=#{@lat},#{@lon}&key=AIzaSyDYx7xwDQTH_giQcHYjPKS1pK0CpHSplug")
      res = HTTP.get(url)
      data = JSON.parse(res.body)
      #byebug
      data['results'][0]['address_components'].each do |c|
        if c['types'][0] == 'neighborhood'
          return c['long_name']
        else
          # do something
        end
      end
    end


    def user_params
      params.require(:user).permit(:street, :city, :state, :address, :neighborhood_id, :latitude, :longitude, :first_name, :last_name)
    end

end
