class Public::FavoritesController < ApplicationController

 def create
  review = Review.find(params[:review_id])
   favorite = current_customer.favorites.new(review_id: review.id)
   favorite.save
  redirect_to public_review_path(review.id)
 end

 def destroy
  review = Review.find(params[:review_id])
   favorite = current_customer.favorites.find_by(review_id: review.id)
   favorite.destroy
  redirect_to public_review_path(review.id)
 end

end