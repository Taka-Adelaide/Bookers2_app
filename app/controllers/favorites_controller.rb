class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new
    favorite.save
    redirect_to books_path
  end
  
  def destroy
    favorite = favorite.find(params[:book.id])
    favorite.destroy
    redirect_to books_path
  end

end
