require 'rails_helper'

RSpec.describe "follows#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/follows/#{follow.id}", payload
  end

  describe 'basic update' do
    let!(:follow) { create(:follow) }

    let(:payload) do
      {
        data: {
          id: follow.id.to_s,
          type: 'follows',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(FollowResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { follow.reload.attributes }
    end
  end
end
