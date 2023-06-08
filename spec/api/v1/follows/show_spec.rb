require "rails_helper"

RSpec.describe "follows#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/follows/#{follow.id}", params: params
  end

  describe "basic fetch" do
    let!(:follow) { create(:follow) }

    it "works" do
      expect(FollowResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("follows")
      expect(d.id).to eq(follow.id)
    end
  end
end
