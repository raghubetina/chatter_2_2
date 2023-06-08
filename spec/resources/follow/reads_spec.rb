require "rails_helper"

RSpec.describe FollowResource, type: :resource do
  describe "serialization" do
    let!(:follow) { create(:follow) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(follow.id)
      expect(data.jsonapi_type).to eq("follows")
    end
  end

  describe "filtering" do
    let!(:follow1) { create(:follow) }
    let!(:follow2) { create(:follow) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: follow2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([follow2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:follow1) { create(:follow) }
      let!(:follow2) { create(:follow) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      follow1.id,
                                      follow2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      follow2.id,
                                      follow1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
