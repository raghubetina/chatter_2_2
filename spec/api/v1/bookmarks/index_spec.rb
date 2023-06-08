require "rails_helper"

RSpec.describe "bookmarks#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/bookmarks", params: params
  end

  describe "basic fetch" do
    let!(:bookmark1) { create(:bookmark) }
    let!(:bookmark2) { create(:bookmark) }

    it "works" do
      expect(BookmarkResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["bookmarks"])
      expect(d.map(&:id)).to match_array([bookmark1.id, bookmark2.id])
    end
  end
end
