class ReviewsController < ApplicationController
  load_and_authorize_resource
  
  def create
    if @review.save
      flash[:success] = t "review.thanks"
    else
      flash[:danger] = t "review.wrong"
    end
    redirect_to :back
  end

  def edit
  end

  def update
    if @review.update review_params
      flash[:success] = t "review.update-success"
    else
      flash[:danger] = t "review.update-fail"
    end
    redirect_to :back
  end

  def destroy
    if @review.destroy 
      flash[:success] = t "review.destroy-success"
    else
      flash[:danger] = t "review.destroy-fail"
    end
    redirect_to :back
  end

  private
  def review_params
    params.require(:review).permit :content, :book_id, :user_id
  end
end
