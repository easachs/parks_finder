class ParksController < ApplicationController
  def index
    @state = params[:state]
    @total = ParksFacade.total_in(params[:state])
    @parks = ParksFacade.parks_in(params[:state])
  end
end