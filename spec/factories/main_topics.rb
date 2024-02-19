FactoryBot.define do
  factory :main_topic do
    name { Faker::Lorem.word }
    location
    category
    start_date { create(:event_date) }
    end_date { create(:event_date) }
  end
end
