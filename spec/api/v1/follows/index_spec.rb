require 'rails_helper'

RSpec.describe "follows#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/follows", params: params
  end

  describe 'basic fetch' do
    let!(:follow1) { create(:follow) }
    let!(:follow2) { create(:follow) }

    it 'works' do
      expect(FollowResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['follows'])
      expect(d.map(&:id)).to match_array([follow1.id, follow2.id])
    end
  end
end
