class MotorcyclesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show, :edit, :update]

  before_action :set_motorcycle, only: [:show, :edit, :update]

  def index
    @available_motorcycles = []
    @location = params[:location]
    @date = params[:daterange].split(" - ").map {|date| Date.strptime(date,"%m/%d/%Y")}
    @motorcycles = Motorcycle.near(@location, 50)

    @motorcycles.each do |motorcycle|
      overlaps = false
      motorcycle.reservations.each do |reservation|
        overlaps = conflict?(reservation, @date)
        break if overlaps
      end
      @available_motorcycles << motorcycle unless overlaps
    end

    @hash = Gmaps4rails.build_markers(@motorcycles) do |motorcycle, marker|
      marker.lat motorcycle.lat
      marker.lng motorcycle.lng
      # marker.infowindow render_to_string(partial: "/motorcycles/map_box", locals: { motorcycle: motorcycle })
    end
  end

  def show
    @reservation = Reservation.new
    if params[:starting_date] && params[:ending_date]
      @starting_date = Date.strptime(params[:starting_date],"%Y-%m-%d")
      @ending_date = Date.strptime(params[:ending_date],"%Y-%m-%d")
    else
      @starting_date = Date.today
      @ending_date = Date.today
    end

    @overall_price = @motorcycle.price.to_f * (@ending_date - @starting_date).to_f
  end

  def new
    @motorcycle = Motorcycle.new
  end


  def create
    @motorcycle = current_user.motorcycles.build(motorcycle_params)
    @motorcycle.availability = true
    @motorcycle.save
    redirect_to profiles_path
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

  def edit
  end

  def update
    if @motorcycle.update(motorcycle_params)
      redirect_to motorcycle_path(@motorcycle)
    else
      render 'edit'
    end
  end

  def destroy
    @motorcycle.destroy
    redirect_to profiles_index_path
  end

  private

  def conflict?(availability_date, reservation_date)
   reservation_date.first.between?( availability_date.starting_date, availability_date.ending_date) ||
   reservation_date.last.between?( availability_date.starting_date, availability_date.ending_date)
  end

  def motorcycle_params
    params.require(:motorcycle).permit(:name, :brand, :model, :year, :city,
    :address, :price, :description,
    :license_plate, photos: [])
  end

  def set_motorcycle
    @motorcycle = Motorcycle.find(params[:id])
  end

end
