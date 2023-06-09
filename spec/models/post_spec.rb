require "rails_helper"

RSpec.describe Post, type: :model do
  describe "Direct Associations" do
    it { should have_many(:bookmarks) }

    it { should have_many(:likes) }

    it { should have_many(:comments) }

    it { should belong_to(:author) }
  end

  describe "InDirect Associations" do
    it { should have_many(:commenters) }

    it { should have_many(:fans) }

    it { should have_many(:bookmarkers) }

    it { should have_many(:author_followers) }

    it { should have_many(:fans_followers) }

    it { should have_many(:bookmarkers_followers) }

    it { should have_many(:commenters_followers) }
  end

  describe "Validations" do
    it { should validate_presence_of(:body) }
  end
end
