class LocationsController < ApplicationController
    #work on this!
    def create
      @location = Location.new(location_params)
      @location.location_key = generate_location_key
  
      if Location.exists?(location_key: @location.location_key)
        # Handle the case where the location_key already exists
        params-:location_key = generate_location_key
        # You might want to generate a new location_key and try again
      else
        if @location.save
          redirect_to @location, notice: 'Location was successfully created.'
        else
          render :new
        end
      end
    end

    def index
      locations = Location.all
      render json: locations
    end
  
    private
  
    def location_params
      params.require(:location).permit(:country, :state, :city)
    end
  
    def generate_location_key
      location_key = params[:country] + params[:state] + params[:city]
    end
  end