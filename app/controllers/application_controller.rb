class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :first_name, :last_name, :state, :city, :street, :address, :neighborhood_id, :latitude, :longitude])
    end

  def after_sign_in_path_for(user)
    if user.neighborhood
      neighborhood_incidents_path(user.neighborhood)
    else
      edit_user_path(user)
    end
  end
end
