require 'rails_helper'

RSpec.describe Repository, type: :model do
  subject { FactoryGirl.create(:repository) }

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:url) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "associations" do
    it { should have_many(:commits) }
  end
end
