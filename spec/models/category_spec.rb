require 'rails_helper'

RSpec.describe Category, type: :model do

    it "is valid with valid attributes" do
        category = build(:category)
        expect(category).to be_valid
    end
end
