class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.book_id = book.id
    favorite.save
    redirect_to books_path
  end

  def destroy
    Favorite.find_by(params[:book_id]).destroy
    redirect_to books_path
  end

end
