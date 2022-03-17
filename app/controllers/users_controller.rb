class UsersController < ApplicationController
  add_flash_types :success, :info, :warning, :danger

  def index
    @users = User.all
    @books = Book.all
  end

  def show
    @users = User.find(params[:id])
    @books = Book.all
  end

  def edit
    @users = User.find(params[:id])
    @books = Book.all
  end

  def update
    @users = User.find(params[:id])
    @users.update(user_params)
    if @users.save
      flash[:update] ="You have updated user successfully."
      redirect_to user_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end



end

