require "rails_helper"

RSpec.describe "follows#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/follows/#{follow.id}"
  end

  describe "basic destroy" do
    let!(:follow) { create(:follow) }

    it "updates the resource" do
      expect(FollowResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Follow.count }.by(-1)
      expect { follow.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
