FactoryBot.define do
  factory :location do
    location_key { Faker::Lorem.characters(10) }
    country { Faker::Address.country }
    state { Faker::Address.state }
    city { Faker::Address.city }
  end
end
