class Category < ApplicationRecord
    has_many :timesuck_episodes
    has_many :main_topics

    #validations
    validates :name, presence: true, uniqueness: true
end
