class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = t "application.nil", column_name: params[:id]
    redirect_to root_url
  end

  private
  def current_ability
    namespace = controller_path.split("/").first
    Ability.new current_user, namespace
  end
end
