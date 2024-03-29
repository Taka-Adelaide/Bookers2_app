class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @books = Book.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: "You have updated user successfully"
    else
      render :edit
    end
  end
  
  def follows
    user = User.find(params[:id])
    @users = user.following_user.all
  end
  
  def followers
    user = User.find(params[:id])
    @users = user.follower_user.all
  end
  
  

  private
  def user_params
    params.require(:user) .permit(:name, :profile_image, :introduction)
  end

  def correct_user
    user = User.find(params[:id])
    if user != current_user
      redirect_to user_path(current_user.id)
    end
  end
end
