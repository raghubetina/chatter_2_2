require "rails_helper"

RSpec.describe Follow, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:follower) }

    it { should belong_to(:leader) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
