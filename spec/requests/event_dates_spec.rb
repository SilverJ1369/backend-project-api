require 'rails_helper'

RSpec.describe EventDatesController, type: :controller do

  describe "post #create" do
    context "with an existing date_key" do
      real_event_date = EventDate.create(year: 2020, month: 1, day: 1, is_ad: true, modifier: 'none')
      it "does not create a duplicate event_date" do
        test_event_date = EventDate.create(year: 2020, month: 1, day: 1, is_ad: true, modifier: 'none')
        debugger
        expect(test_event_date).to eq(1)
      end
    end

    context "with a new date_key" do
      let(:valid_attributes) { { year: 2020, month: 1, day: 1, is_ad: true, modifier: 'none' } }
      it "creates a new EventDate" do
        expect {
          post :create, params: { event_date: valid_attributes }
        }.to change(EventDate, :count).by(1)
      end
    end
  end
end
