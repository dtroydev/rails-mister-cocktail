class ReviewsController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @review.cocktail = @cocktail

    if @review.save
      redirect_to @review.cocktail
    else
      @dose = Dose.new # so dose form doesn't crash
      @dose.quantity = ''
      @dose.measure = ''
      render 'cocktails/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
