require 'rails_helper'

RSpec.describe "bookmarks#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/bookmarks/#{bookmark.id}"
  end

  describe 'basic destroy' do
    let!(:bookmark) { create(:bookmark) }

    it 'updates the resource' do
      expect(BookmarkResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Bookmark.count }.by(-1)
      expect { bookmark.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
