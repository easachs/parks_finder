class ParksController < ApplicationController
  def index
    @state = params[:state]
    @parks = ParksFacade.parks_in(params[:state])
  end
end