class CarsController < ApplicationController
  def index
    @cars = Car.order(:id)
  end

  def new
    @car = Car.new

  end

  def edit
    @car = Car.find(params[:id])
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      if params[:photos]
        params[:photos].each { |p| @car.pictures.create(photo: p)}
      end
      redirect_to '/'
    else
      render action: 'new'
    end
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    if params[:photos]
      params[:photos].each { |p| @car.pictures.create(photo: p)}
    end
    redirect_to '/'
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to '/'
  end

  private

    def car_params
      params.require(:car).permit(:name, :auto_number, :pts_number, :pts_date, pictures_attributes: [:photo])
    end
end
