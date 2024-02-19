FactoryBot.define do
  factory :timeline_event do
    main_topic
    location
    details { Faker::Lorem.paragraph }
    event_date
    is_graphic { Faker::Boolean.boolean }
  end
end
