class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = @users.page params[:page]
  end

  def show    
  end

  def destroy
    if @user.destroy
      flash[:success] = t "user.destroy"
    else
      flash[:dager] = t "user.destroy_fail"
    end
    redirect_to admin_users_path
  end
end
