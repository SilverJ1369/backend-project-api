class MainTopicsController < ApplicationController
  def create
    main_topic = MainTopic.new(main_topic_params)
    if main_topic.save
      render json: main_topic, status: :created, include: [ :location, :category, :start_date, :end_date ]
    else
      render json: main_topic.errors, status: :unprocessable_entity
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

  def search
    search_name = search_params[:search_name]
    search_start_year = search_params[:search_start_year]
    search_end_year = search_params[:search_end_year]
    search_category = search_params[:search_category]
    debugger

    filtered_main_topics = MainTopic.all

    if search_name.present?
      filtered_main_topics = filtered_main_topics.where("main_topics.name LIKE ?", "%#{search_name}%")
    end
  
    if search_start_year.present?
      filtered_main_topics = filtered_main_topics.where("strftime('%Y', main_topics.start_date) >= ?", search_start_year)
    end
  
    if search_end_year.present?
      filtered_main_topics = filtered_main_topics.where("strftime('%Y', main_topics.end_date) <= ?", search_end_year)
    end
  
    if search_category.present?
      filtered_main_topics = filtered_main_topics.joins(:category).where(categories: { name: search_category })
    end
    render json: filtered_main_topics
  end

  private

  def find_main_topic
    main_topic = MainTopic.find(params[:id])
  end

  def main_topic_params
    params.require(:main_topic).permit(:name, :start_date_id, :end_date_id, :location_id, :category_id)
  end

  def search_params
    params.permit(:search_name, :search_start_year, :search_end_year, :search_category)
  end
end
