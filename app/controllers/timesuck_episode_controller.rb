class TimesuckEpisodeController < ApplicationController

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

    private

    def timesuck_episode_params
        params.require(:timesuck_episode).permit(:episode_number, :category_id, :main_topic_id)
    end 
end
