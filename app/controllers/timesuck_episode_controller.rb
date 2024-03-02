class TimesuckEpisodeController < ApplicationController

    before_action :find_timesuck_episode, only: [:show, :update, :destroy]

    def create
        timesuck_episode = TimesuckEpisode.new(timesuck_episode_params)
        if timesuck_episode.save
            render json: timesuck_episode, status: :created
        else
            render json: timesuck_episode.errors, status: :unprocessable_entity
        end
    end

    def index
        timesuck_episodes = TimesuckEpisode.all
        render json: timesuck_episodes
    end

    def show
        render json: timesuck_episode
    end

    def update
        render json: timesuck_episode.update(timesuck_episode_params)
    end

    def destroy
        timesuck_episode.destroy
    end

    private

    def find_timesuck_episode
        timesuck_episode = TimesuckEpisode.find(params[:id])
    end

    def timesuck_episode_params
        params.require(:timesuck_episode).permit(:episode_number, :category_id, :main_topic_id)
    end 
end
