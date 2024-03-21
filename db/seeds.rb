# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
# db/seeds.rb
category = Category.create(name: 'True Crime')
category = Category.create(name: 'Historical')
category = Category.create(name: 'Cult')
category = Category.create(name: 'Motivational')
category = Category.create(name: 'Scientific')
category = Category.create(name: 'Random/Miscellaneous')
5.times do

    location = Location.create(location_key: Faker::Lorem.word, country: Faker::Address.country, state: Faker::Address.state, city: Faker::Address.city)
    
    event_date_1 = EventDate.create(date_key: Faker::Lorem.paragraph, year: Faker::Number.between(from: 1900, to: 1975), month: Faker::Number.between(from: 1, to: 12), day: Faker::Number.between(from: 1, to: 31), is_ad: true, modifier: 'Some Name');

    event_date_2 = EventDate.create(date_key: Faker::Lorem.paragraph, year: Faker::Number.between(from: 1976, to: 2024), month: Faker::Number.between(from: 1, to: 12), day: Faker::Number.between(from: 1, to: 31), is_ad: true, modifier: 'Some Name');

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

