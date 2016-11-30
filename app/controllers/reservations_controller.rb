class ReservationsController < ApplicationController
  before_action :find_motorcycle, only: [ :new, :create, :show ]

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(@motorcycle)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = @motorcycle.reservations.build(reservation_params)
    @reservation.user_id = current_user
    @reservation.save
    redirect_to root_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:starting_date, :ending_date, :overall_price)
  end

  def find_motorcycle
    @motorcycle = Motorcycle.find(params[:motorcycle_id])
  end

end

