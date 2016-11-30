class MotorcyclesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_motorcycle, only: :show

  def index
    @motorcycles = Motorcycle.all
  end

  def show
    @reservation = Reservation.new
  end

private

  def set_motorcycle
    @motorcycle = Motorcycle.find(params[:id])
  end

end
