# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# category = Category.create(name: 'Some Name');

# event_date_1 = EventDate.create(date_key: 'Some Name', year: 1, month: 1, day: 1, is_ad: true, modifier: 'Some Name');

# event_date_2 = EventDate.create(date_key: 'Some Name', year: 2, month: 1, day: 1, is_ad: true, modifier: 'Some Name');

# location = Location.create(location_key: 'Some Name', country: 'Some Name', state: 'Some Name', city: 'Some Name');

# episode = TimesuckEpisode.create(episode_number: 'Some Name', category: category);

# topic = MainTopic.create(name: 'Some Name', timesuck_episodes: episode, location: location, category: category, start_date: event_date_1, end_date: event_date_2);

# event1 = TimelineEvent.create(main_topic: nil, location: location, details: 'Some Details', event_date: event_date_1, is_graphic: false);
require 'faker'
# db/seeds.rb
10.times do
    category = Category.create(name: Faker::Lorem.word)

    location = Location.create(location_key: Faker::Lorem.word, country: Faker::Address.country, state: Faker::Address.state, city: Faker::Address.city)
    
    event_date_1 = EventDate.create(date_key: 'Some Name', year: 1, month: 1, day: 1, is_ad: true, modifier: 'Some Name');

    event_date_2 = EventDate.create(date_key: 'Some Name', year: 2, month: 1, day: 1, is_ad: true, modifier: 'Some Name');
    
    main_topic = MainTopic.create(
        name: Faker::Lorem.word,
        location: location,
        category: category,
        start_date: event_date_1,
        end_date: event_date_2
        )

    timesuck_episode = TimesuckEpisode.create(
        episode_number: Faker::Number.number(digits: 2),
        category: category
    )

    5.times do
        TimelineEvent.create(
            location: location,
            details: Faker::Lorem.sentence,
            main_topic: main_topic,
            event_date: event_date_1,
            is_graphic: false
        )
    end
end