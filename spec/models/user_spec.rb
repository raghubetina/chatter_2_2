require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:bookmarks) }

    it { should have_many(:likes) }

    it { should have_many(:comments) }

    it { should have_many(:own_posts) }

    it { should have_many(:follows_as_follower) }

    it { should have_many(:follows_as_leader) }

    end

    describe "InDirect Associations" do

    it { should have_many(:followers) }

    it { should have_many(:leaders) }

    it { should have_many(:commented_posts) }

    it { should have_many(:liked_posts) }

    it { should have_many(:bookmarked_posts) }

    it { should have_many(:leaders_own_posts) }

    it { should have_many(:leaders_liked_posts) }

    it { should have_many(:leaders_bookmarked_posts) }

    it { should have_many(:leaders_commented_posts) }

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:username) }

    it { should validate_presence_of(:username) }

    end
end
