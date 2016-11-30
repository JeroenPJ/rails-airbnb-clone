class MotorcyclesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_motorcycle, only: :show

  def index
    @motorcycles = Motorcycle.all
  end

  def show

  end

  def new

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
