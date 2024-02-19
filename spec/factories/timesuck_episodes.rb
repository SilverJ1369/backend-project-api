FactoryBot.define do
  factory :timesuck_episode do
    episode_number { Faker::Number.number(digits: 3).to_s }
    category
    main_topic
  end
end
