class TimelineEventsController < ApplicationController

    def create
        timeline_event = TimelineEvent.new(timeline_event_params)
        if timeline_event.save
            render json: timeline_event, status: :created
        else
            render json: timeline_event.errors, status: :unprocessable_entity
        end
    end

    def search_by_main_topic
        maintopic_name = params[:maintopic_name]
        timeline_events = TimelineEvent.joins(:main_topic).where(main_topic: { name: maintopic_name })
        render json: timeline_events, include: [:event_date, :location, :main_topic]
    end

    def index
        timeline_events = TimelineEvent.all
        render json: timeline_events, include: [:main_topic]
    end

    def show
        render json: timeline_event
    end

    def update
        render timeline_event.update(timeline_event_params)
    end

    def destroy
        timeline_event.destroy
    end

    private

    def find_timeline_event
        timeline_event = TimelineEvent.find(params[:id])
    end
    
    def timeline_event_params
        params.require(:timeline_event).permit(:main_topic_id, :location_id, :details, :event_date_id, :is_graphic)
    end
end
