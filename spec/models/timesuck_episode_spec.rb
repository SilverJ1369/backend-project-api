require 'rails_helper'

RSpec.describe TimesuckEpisode, type: :model do

  it "is valid with valid attributes" do
    test_episode = build(:timesuck_episode)
    expect(test_episode).to be_valid
  end
end
