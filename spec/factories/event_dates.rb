FactoryBot.define do
  factory :event_date do
    date_key { Faker::Lorem.word }
    year { Faker::Number.within(range: 1900..2022) }
    month { Faker::Number.within(range: 1..12) }
    day { Faker::Number.within(range: 1..31) }
    is_ad { Faker::Boolean.boolean }
    modifier { Faker::Lorem.word }
  end
end
