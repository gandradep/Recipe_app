require 'rails_helper'

RSpec.describe "ShopLists", type: :request do
  describe "GET /display" do
    it "returns http success" do
      get "/shop_lists/display"
      expect(response).to have_http_status(:success)
    end
  end

end
