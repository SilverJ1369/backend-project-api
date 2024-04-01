class MainTopicsController < ApplicationController
  def create
    result = MainTopicService::Base.create(main_topic_params)
    if result.success?
      render_success(payload: result.payload)
    else
      render_error(errors: result.errors)
    end
  end

  def index
    main_topics = MainTopic.all
    render json: main_topics, include: [ :location, :category, :start_date, :end_date ]
  end

  def show
    render json: main_topic, include: [ :location, :category, :start_date, :end_date ]
  end

  def update
    render json: main_topic.update(main_topic_params)
  end

  def destroy
    main_topic.destroy
  end

  private

  def find_main_topic
    main_topic = MainTopic.find(params[:id])
  end

  def main_topic_params
    params.require(:main_topic).permit(:name, :start_date_id, :end_date_id, :location_id, :category_id)
  end
end
