require 'rails_helper'

RSpec.describe Like, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:post) }

    it { should belong_to(:fan) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
