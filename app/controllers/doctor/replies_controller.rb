class Doctor::RepliesController < ApplicationController

  def new
  end
  
  def confirm
  end
  
  def create
     @review = Review.find(params[:review_id])
     @reply = current_doctor.replies.build(reply_params)
     if @reply.save
       flash[:notice] = "返信が完了しました."
       redirect_to doctor_reviews_path
     else
      render :index, flash[:alret] = "返信に失敗しました。"
     end
  end
  
  def index
    @review = Review.find(params[:review_id])
    @reply = @review.replies.build
  end
  
  def show
    @review = Review.find(params[:review_id])
    @replies = @review.replies 
  end
  
  private
  
  def reply_params
    params.require(:reply).permit(:comment, :review_id)
  end
end
