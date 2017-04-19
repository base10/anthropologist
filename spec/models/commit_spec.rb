require 'rails_helper'

RSpec.describe Commit, type: :model do
  describe "validations" do
    subject { FactoryGirl.create(:commit) }

    it { should validate_presence_of(:reference) }
    it { should validate_uniqueness_of(:reference) }
    it { should validate_presence_of(:repository_id) }
  end

  describe "associations" do
    it { should belong_to(:repository) }
    it { should have_and_belong_to_many(:authors) }
  end
end
