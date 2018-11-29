class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user = User.find(params[:id])
    authorize @review
    if @review.save
      if @review.user.average_rating == nil
        @review.user.average_rating = @review.rating.to_i
        @review.user.update_attribute(:average_rating, @review.rating.to_i)

      else
        review_count = @review.user.reviews.count
        total = review_count * @review.user.average_rating
        total += @review.rating
        average_rating = total / (review_count)
        @review.user.update_attribute(:average_rating, average_rating)

      end
      redirect_to profile_path(@review.user)
    else
      render 'pages/profile'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
