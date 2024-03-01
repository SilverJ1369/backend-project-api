class LocationsController < ApplicationController

    def create
      incoming_location_key = generate_location_key
      existing_location = Location.find_by(location_key: incoming_location_key)
      
      if existing_location
        render json: existing_location
      else
        location = Location.new(location_params.merge(location_key: incoming_location_key))
        render json: location if location.save
      end
    end

    def index
      locations = Location.all
      render json: locations
    end

    def show
      render json: Location.find(params[:id])
    end

    def update
      location = Location.find(params[:id])
      new_location_key = generate_location_key
      location.update(location_params.merge(location_key: new_location_key))
      render json: location
    end

    def destroy
      location = Location.find(params[:id])
      location.destroy
    end
  
    private
  
    def location_params
      params.require(:location).permit(:country, :state, :city)
    end

    def generate_location_key
      return "#{location_params[:country]}#{location_params[:state]}#{location_params[:city]}"
    end
  
  end