require 'rails_helper'

RSpec.describe "bookmarks#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/bookmarks/#{bookmark.id}", params: params
  end

  describe 'basic fetch' do
    let!(:bookmark) { create(:bookmark) }

    it 'works' do
      expect(BookmarkResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('bookmarks')
      expect(d.id).to eq(bookmark.id)
    end
  end
end
