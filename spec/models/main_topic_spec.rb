# spec/models/main_topic_spec.rb
require 'rails_helper'


RSpec.describe MainTopic, type: :model do

  it "is valid with valid attributes" do
    main_topic = build(:main_topic)
    expect(main_topic).to be_valid
  end

  # it "is not valid without a name" do
  #   main_topic = MainTopic.new(name: nil)
  #   expect(main_topic).to_not be_valid
  # end

  # Add more tests for other attributes as needed
end