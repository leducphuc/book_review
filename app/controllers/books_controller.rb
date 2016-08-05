class BooksController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def index
    load_categories
    @q = @books.ransack params[:q]
    @books = @q.result.page params[:page]
  end  

  private
  def load_categories
    @categories = Category.all
    @category_selects = @categories.collect {|category| [category.name, category.id]}
    @rating_selects = Book.ratings.map {|key,value| [t("rate.#{key}"),value]}
  end
end
