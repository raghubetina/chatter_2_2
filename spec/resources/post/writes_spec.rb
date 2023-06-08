require "rails_helper"

RSpec.describe PostResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "posts",
          attributes: {},
        },
      }
    end

    let(:instance) do
      PostResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Post.count }.by(1)
    end
  end

  describe "updating" do
    let!(:post) { create(:post) }

    let(:payload) do
      {
        data: {
          id: post.id.to_s,
          type: "posts",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      PostResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to(change { post.reload.updated_at })
      # .and change { post.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:post) { create(:post) }

    let(:instance) do
      PostResource.find(id: post.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Post.count }.by(-1)
    end
  end
end
