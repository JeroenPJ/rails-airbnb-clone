class MotorcyclesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_motorcycle, only: [:show]

  def index
    @motorcycles = Motorcycle.all
  end

  def show
    @reservation = Reservation.new
  end

  def new
  end

  def availability
    @available_motorcycles = []
    @unavailable_motorcycles = []
  end

  def search
    location = params[:location]
    date = params[:daterange].split(" - ").map {|date| Date.strptime(date,"%m/%d/%Y")}
    @motorcycles = Motorcycle.where(city: location)
    p @motorcycles
    @motorcycles.each do |motorcycle|
      motorcycle.reservations.each do |reservation|
        @motorcycles.remove(motorcycle) if conflict?(reservation, date)
        #   @unavailable_motorcycles << motorcycle
      end
    end
  end

  def conflict?(availability_date, reservation_date)
    !(Time.parse(availability_date.last)  <= Time.parse(reservation.first) ||
      Time.parse(availability_date.first) >= Time.parse(reservation.last))
  end

  private

  def motorcycle_params
    params.require(:motorcycle).permit(:name, :brand, :model, :year, :city,
     :address, :price, :description,
     :license_plate, photos: [])
  end

  def set_motorcycle
    @motorcycle = Motorcycle.find(params[:id])
  end

end
