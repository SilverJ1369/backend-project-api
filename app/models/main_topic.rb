class MainTopic < ApplicationRecord
  has_many :timeline_events
  has_many :timesuck_episodes
  belongs_to :location
  belongs_to :category
  belongs_to :start_date, class_name: "EventDate"
  belongs_to :end_date, class_name: "EventDate"

  #validations
  validates :name, :start_date, :end_date, :location, :category, presence: true
end
