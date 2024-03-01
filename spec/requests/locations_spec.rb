require 'rails_helper'

RSpec.describe LocationsController, type: :requests do

  describe "POST #create" do
    context "with an existing location_key" do
      real_location = Location.new(country: 'USA', state: 'Missouri', city: 'Jackson')
      it "does not create a new Location" do
        test_location = Location.new(country: 'USA', state: 'Missouri', city: 'Jackson')
        expect(Location.count).to eq(1)
      end
    end

    context "with a new location_key" do
      let(:valid_attributes) { { country: 'USA', state: 'Missouri', city: 'Dexter' } }
      it "creates a new Location" do
        expect {
          post :create, params: { location: valid_attributes }
        }.to change(Location, :count).by(1)
      end
    end
  end
end