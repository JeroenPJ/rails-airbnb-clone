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
    @daterange = params[:daterange].split(" - ").map {|date| Date.strptime(date,"%m/%d/%Y")}
    @reservation = @motorcycle.reservations.build(reservation_params)
    @reservation.user = current_user
    @reservation.starting_date = @daterange[0]
    @reservation.ending_date = @daterange[1]
    @reservation.overall_price = @motorcycle.price * (@daterange[1] - @daterange[0])
    @reservation.save
    redirect_to profiles_path
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to profiles_path
  end

  private

  def reservation_params
    #params.require(:reservation).permit(:daterange, :overall_price)
  end

  def find_motorcycle
    @motorcycle = Motorcycle.find(params[:motorcycle_id])
  end

end

