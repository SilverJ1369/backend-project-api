class TimelineEventsController < ApplicationController

    def create
        @timeline_event = TimelineEvent.new(timeline_event_params)
        if @timeline_event.save
            render json: @timeline_event, status: :created
        else
            render json: @timeline_event.errors, status: :unprocessable_entity
        end
    end


    private
    def timeline_event_params
        params.require(:timeline_event).permit(:main_topic_id, :location_id, :details, :event_date_id, :is_graphic)
    end
end
