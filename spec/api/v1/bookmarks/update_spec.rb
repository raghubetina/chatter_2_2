require 'rails_helper'

RSpec.describe "bookmarks#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/bookmarks/#{bookmark.id}", payload
  end

  describe 'basic update' do
    let!(:bookmark) { create(:bookmark) }

    let(:payload) do
      {
        data: {
          id: bookmark.id.to_s,
          type: 'bookmarks',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(BookmarkResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { bookmark.reload.attributes }
    end
  end
end
