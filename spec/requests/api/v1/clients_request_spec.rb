require 'rails_helper'

RSpec.describe "Api::V1::Clients", type: :request do

  describe "GET /total_count" do
    it "returns http success" do
      get "/api/v1/clients/total_count"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /policies" do
    it "returns http success" do
      get "/api/v1/clients/12/policies"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /list" do
    it "returns http success" do
      get "/api/v1/clients/list"
      expect(response).to have_http_status(:success)
    end
  end

end
