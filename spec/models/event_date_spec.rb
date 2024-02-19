require 'rails_helper'

RSpec.describe EventDate, type: :model do

    it "is valid with valid attributes" do
        event_date = build(:event_date)
        expect(event_date).to be_valid
    end
end
