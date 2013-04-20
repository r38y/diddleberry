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

  context "on create" do
    it "should create a token" do
      email = create(:email)

      email.token.should_not be_blank
    end
  end

  context "on destroy" do
    it "should work" do
      user = create(:user)
      email_one = create(:email, user: user)
      email_two = create(:email, user: user)

      user.emails.count.should eq(2)
      expect {
        email_one.destroy
      }.to change(user.emails, :count).by(-1)
    end

    it "should fail if not deleteable" do
      user = create(:user)
      email = create(:email, user: user)

      expect {
        email.destroy
      }.to_not change(user.emails, :count)
    end
  end

  describe "#confirmed?" do
    it "should be false by default" do
      email = create(:email)

      email.should_not be_confirmed
    end

    it "should be true if confirmed_at set" do
      email = create(:email, :confirmed)

      email.should be_confirmed
    end
  end

  describe "#confirm!" do
    it "should make the email confirmed" do
      email = create(:email)

      expect {
        email.confirm!
      }.to change(email, :confirmed?).to(true)
    end

    it "should not change confirmed_at if already confirmed" do
      email = create(:email, :confirmed)

      expect {
        email.confirm!
      }.to_not change(email, :confirmed_at)
    end
  end
end
