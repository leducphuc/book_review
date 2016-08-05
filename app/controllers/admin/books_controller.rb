class Admin::BooksController < ApplicationController
  load_and_authorize_resource
  before_action :load_categories, only: [:new, :edit]

  def new
  end

  def create
    if @book.save
      flash[:success] = t "book.create_notice"
      redirect_to admin_book_path @book
    else 
      load_categories
      render :new
    end
  end

  def show
  end

  def edit
  end

  def index
    load_categories
    @q = @books.ransack params[:q]
    @books = @q.result.page params[:page]
  end  

  def destroy
    if @book.destroy
      flash[:success] = t "book.destroy"
    else 
      flash.new[:danger] = t "book.destroy_alert"
    end
    redirect_to admin_books_path
  end

  def update
    if @book.update book_params
      flash[:success] = t "book.update_notice"
      redirect_to admin_book_path @book
    else
      load_categories
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit :title, :author, :category_id, 
      :number_of_pages, :publish_date
  end

  def load_categories
    @categories = Category.all
    @category_selects = @categories.collect {|category| [category.name, category.id]}
  end
end
