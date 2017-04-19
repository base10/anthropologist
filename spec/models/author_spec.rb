require 'rails_helper'

RSpec.describe Author, type: :model do
  describe "validations" do
    subject { FactoryGirl.create(:author) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe "associations" do
    it { should have_and_belong_to_many(:commits) }
  end
end
