require 'rails_helper'

RSpec.describe Repository, type: :model do
  describe "validations" do
    subject { FactoryGirl.create(:repository) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:url) }
    it { should validate_uniqueness_of(:name) }
  end
end
