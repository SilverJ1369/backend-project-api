require 'rails_helper'

RSpec.describe TimelineEvent, type: :model do

  it "is valid with valid attributes" do
    test_event = build(:timeline_event)
    expect(test_event).to be_valid
  end
end
