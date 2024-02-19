class TimesuckEpisode < ApplicationRecord
  belongs_to :category
  belongs_to :main_topic

  #validations
  validates :episode_number, presence: true, uniqueness: true
  validates :category, :main_topic, presence: true
end
