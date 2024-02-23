class EventDatesController < ApplicationController

    def create
        @event_date = EventDate.new(event_date_params)
        if @event_date.save
            render json: @event_date, status: :created
        else
            render json: @event_date.errors, status: :unprocessable_entity
        end
    end

    def event_date_params
        params.date_key = params[:year].to_s << params[:month].to_s << params[:day].to_s << params[:is_ad].to_s << params[:modifier].to_s
        params.require(:event_date).permit(:year, :month, :day, :is_ad, :modifier)
    end
end
