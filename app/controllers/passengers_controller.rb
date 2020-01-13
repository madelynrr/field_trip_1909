class PassengersController < ApplicationController

  def show
    @passenger = Passenger.find(params[:id])
  end

  def update
    flight = Flight.where(number: params[:number])
    passenger = Passenger.find(params[:id])
    passenger.flights << flight
    redirect_to "/passengers/#{passenger.id}"
  end

end
