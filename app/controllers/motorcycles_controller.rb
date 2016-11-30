class MotorcyclesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_motorcycle, only: :show

  def index
    @motorcycles = Motorcycle.all
  end

  def show

  end

  def new
    @motorcycle = Motorcycle.new
  end


  def create
    @motorcycle = current_user.motorcycles.build(motorcycle_params)
    @motorcycle.availability = true
    @motorcycle.save
    redirect_to profiles_index_path
    # respond_to do |format|
    #   if @motorcycle.save
    #     format.html { redirect_to current_user, notice: 'Motorcycle was successfully added.' }
    #     format.json { render :show, status: :created, location: current_user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @motorcycle.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @motorcycle.destroy
    redirect_to profiles_index_path
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
