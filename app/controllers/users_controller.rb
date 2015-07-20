class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = Users.all
  end

  def show
  end

  def edit
  end

  def update
    @user.update user_params
    if @user.save
      redirect_to user_path, flash: {success: "#{@user.username} updated!"}
    else
      render :edit
    end
  end

  def destroy
    @user.destroy && session[:user_id] = nil
    redirect_to root_path, flash: {success: "#{@user.username} deleted"}
  end

  private

  def set_user
    @user = User.find params[:id]
  end
  
  def user_params
    params.require(:user).permit(
      :username,
      :password,
      :avatar_url
    )
  end
end
