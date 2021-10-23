class UsersController < ApplicationController
  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = current_user
    @book = Book.new
    @books = current_user.book
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user) .permit(:name, :profile_image, :introduction)
  end
end
