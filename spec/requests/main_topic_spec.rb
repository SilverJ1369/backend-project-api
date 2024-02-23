require 'rails_helper'

RSpec.describe "MainTopics", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/main_topic/create"
      expect(response).to have_http_status(:success)
    end
  end

end
