FactoryBot.define do
  factory :location do
    location_key { "Location key test" }
    country { Faker::Address.country }
    state { Faker::Address.state }
    city { Faker::Address.city }
  end
end
