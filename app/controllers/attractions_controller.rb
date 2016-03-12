class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = current_user 
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attraction_params)
    attraction.save
    redirect_to attraction
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    attraction = Attraction.find(params[:id])
    attraction.update(attraction_params)
    redirect_to attraction
  end


  def ride
    ride = Ride.new(user: current_user, attraction: Attraction.find(params[:attraction_id]))
    ride.save
    flash[:notice] = ride.take_ride
    redirect_to current_user
  end

  private

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

end


