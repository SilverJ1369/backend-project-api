class Location < ApplicationRecord
    has_many :main_topics
    has_many :timeline_events

    #validations
    validates :location_key, presence: true, uniqueness: true
    validates :country, presence: true

    
end
