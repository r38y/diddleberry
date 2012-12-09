require 'spec_helper'

describe Email do
  it "should create a valid record" do
    expect {
      create(:email)
    }.to change(Email, :count).by(1)
  end

  context "associations" do
    it { should belong_to(:user) }
  end

  context "validations" do
    it { should validate_presence_of(:address) }
    it {
      create(:email)
      should validate_uniqueness_of(:address)
    }
  end
end
