require 'rails_helper'

RSpec.describe FollowResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'follows',
          attributes: { }
        }
      }
    end

    let(:instance) do
      FollowResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Follow.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:follow) { create(:follow) }

    let(:payload) do
      {
        data: {
          id: follow.id.to_s,
          type: 'follows',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      FollowResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { follow.reload.updated_at }
      # .and change { follow.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:follow) { create(:follow) }

    let(:instance) do
      FollowResource.find(id: follow.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Follow.count }.by(-1)
    end
  end
end
