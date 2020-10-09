require 'rails_helper'

RSpec.describe "Api::V1::Carriers", type: :request do

  describe "GET /total_count" do
    it "returns http success" do
      get "/api/v1/carriers/total_count"
      expect(response).to have_http_status(:success)
    end
  end

end
