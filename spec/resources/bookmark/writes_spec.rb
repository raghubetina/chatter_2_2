require 'rails_helper'

RSpec.describe BookmarkResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'bookmarks',
          attributes: { }
        }
      }
    end

    let(:instance) do
      BookmarkResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Bookmark.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:bookmark) { create(:bookmark) }

    let(:payload) do
      {
        data: {
          id: bookmark.id.to_s,
          type: 'bookmarks',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      BookmarkResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { bookmark.reload.updated_at }
      # .and change { bookmark.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:bookmark) { create(:bookmark) }

    let(:instance) do
      BookmarkResource.find(id: bookmark.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Bookmark.count }.by(-1)
    end
  end
end
