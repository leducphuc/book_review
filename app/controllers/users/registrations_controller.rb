class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: :update

  protected
  def configure_account_update_params
    devise_parameter_sanitizer.permit :account_update, keys: [:name, :password, 
      :password_confirmation, :avatar, :current_password]
  end
end
