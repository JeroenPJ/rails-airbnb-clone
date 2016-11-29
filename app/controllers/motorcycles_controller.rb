class MotorcyclesController < ApplicationController
  def index
    @motorcycles = Motorcycle.all
  end

  def show
  end
end
