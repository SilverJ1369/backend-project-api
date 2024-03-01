class EventDatesController < ApplicationController

    def create
        incoming_event_date_key = generate_event_date_key
        existing_event_date = EventDate.find_by(date_key: incoming_event_date_key)

        if existing_event_date
            render json: existing_event_date
        else
            event_date = EventDate.new(event_date_params.merge(date_key: incoming_event_date_key))
            render json: event_date if event_date.save
        end
    end

    def index
        event_dates = EventDate.all
        render json: event_dates
    end

    def event_date_params
        params.require(:event_date).permit(:year, :month, :day, :is_ad, :modifier)
    end

    def generate_event_date_key
        return "#{event_date_params[:year].to_s}#{event_date_params[:month].to_s}#{event_date_params[:day].to_s}#{event_date_params[:modifier]}"
    end
end
