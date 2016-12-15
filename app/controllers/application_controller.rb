class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :address, :first_name, :last_name, :state, :city, :street, :neighborhood_id, :latitude, :longitude])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :first_name, :last_name, :state, :city, :street, :address, :neighborhood_id, :latitude, :longitude])
    end

  def after_sign_in_path_for(user)
    if user.neighborhood
      neighborhood_incidents_path(user.neighborhood)
    else
      edit_user_path(user)
    end
  end

  # def after_sign_up_path_for(user)
  #   if user.neighborhood
  #     neighborhood_incidents_path(user.neighborhood)
  #   else
  #     edit_user_path(user)
  #   end
  # end

end
