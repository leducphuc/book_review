class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build comment_params
    @review = Review.find @comment.review_id unless 
      comment_params[:review_id].nil?
    byebug
    unless @comment.save
      flash[:danger] = "Fail"
    end
    redirect_to root_url
  end

  def destroy
    #do destroy
  end
  
  private
  def comment_params
    params.require(:comment).permit :content, :review_id, :parent_id
  end
end
