class BooksController < ApplicationController
  load_and_authorize_resource

  def show
    @review ||= current_user.reviews.new
    @comment = current_user.comments.new
  end

  def index
    load_categories
    @q = @books.ransack params[:q]
    @books = @q.result.page params[:page]
  end

  def load_categories
    @categories = Category.all
    @category_selects = @categories.collect {|category| [category.name,
      category.id]}
    @rating_selects = Book.ratings.map {|key,value| [t("rate.#{key}"),value]}
  end
end
