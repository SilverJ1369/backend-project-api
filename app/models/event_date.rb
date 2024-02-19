class EventDate < ApplicationRecord
    has_many :timeline_events
    has_many :main_topics

    #validations
    validates :date_key, presence: true, uniqueness: true
    validates :year, presence: true
    validates :is_ad, inclusion: { in: [true, false] }
end
