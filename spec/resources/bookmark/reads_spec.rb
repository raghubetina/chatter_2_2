require 'rails_helper'

RSpec.describe BookmarkResource, type: :resource do
  describe 'serialization' do
    let!(:bookmark) { create(:bookmark) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(bookmark.id)
      expect(data.jsonapi_type).to eq('bookmarks')
    end
  end

  describe 'filtering' do
    let!(:bookmark1) { create(:bookmark) }
    let!(:bookmark2) { create(:bookmark) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: bookmark2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([bookmark2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:bookmark1) { create(:bookmark) }
      let!(:bookmark2) { create(:bookmark) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            bookmark1.id,
            bookmark2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            bookmark2.id,
            bookmark1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
