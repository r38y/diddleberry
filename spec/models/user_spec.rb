require 'spec_helper'

describe User do
  it "should create a valid record" do
    expect {
      create(:user)
    }.to change(User, :count).by(1)
  end

  context "associations" do
    it { should have_many(:emails).dependent(:destroy) }
  end

  describe ".from_email(email)" do
    context "when the email doesn't exist" do
      it "should create a new user" do
        expect {
          User.from_email('bob@bob.com')
        }.to change(User, :count).by(1)
      end

      it "should create a new email" do
        expect {
          @user = User.from_email('bob@bob.com')
          email = @user.emails.first
        }.to change(Email, :count).by(1)

        email = Email.find_by_address('bob@bob.com')
        email.user.should eql(@user)
      end
    end

    context "when the email exists" do
      before do
        @email = create(:email, address: 'bob@bob.com')
      end

      it "should not create a new user" do
        expect {
          User.from_email('bob@bob.com')
        }.to_not change(User, :count)
      end

      it "should not create a new email" do
        expect {
          User.from_email('bob@bob.com')
        }.to_not change(Email, :count)
      end

      it "should return the existing user" do
        found_user = User.from_email('bob@bob.com')

        found_user.should eql(@email.user)
      end
    end
  end
end
