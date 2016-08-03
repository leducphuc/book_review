class BooksController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def index
    @books = @books.page params[:page]
  end  
end
