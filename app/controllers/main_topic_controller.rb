class MainTopicController < ApplicationController
  def create
    @main_topic = MainTopic.new(main_topic_params)
    if @main_topic.save
      render json: @main_topic, status: :created, include: [ :location, :category, :start_date, :end_date ]
    else
      render json: @main_topic.errors, status: :unprocessable_entity
    end
  end

  def index
    main_topics = MainTopic.all
    render json: main_topics, include: [ :location, :category, :start_date, :end_date ]
  end

  private

  def main_topic_params
    params.require(:main_topic).permit(:name, :start_date_id, :end_date_id, :location_id, :category_id)
  end
end
