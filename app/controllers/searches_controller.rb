class SearchesController < ApplicationController
  def search
    @model = params["model"]
    @method = params["method"]
    @content = params["content"]
    @records = search_for(@model, @content, @method)
    redirect_to "/search_index"
  end

  def index
  end

  private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      else
        User.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == 'book'
      if method == 'perfect'
        Book.where(title: content)
      else
        Post.where('title LIKE ?', '%'+content+'%')
      end
    end
  end
end
