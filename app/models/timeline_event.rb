class TimelineEvent < ApplicationRecord
  belongs_to :main_topic
  belongs_to :location
  belongs_to :event_date

  #validations
  validates :main_topic, :location, :event_date, presence: true
  validates :is_graphic, inclusion: { in: [true, false] }
end
