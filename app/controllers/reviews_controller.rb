class ReviewsController < ApplicationController

  before_action :find_reservation, only: [:new, :create, :show]
  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    if @reservation.review.nil?
      @review = Review.new
    else
      redirect_to profiles_path
    end
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      @reservation.review = @review
      redirect_to profiles_path
    else
      render 'new'
    end
  end

  def destroy
  end


private

  def find_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
