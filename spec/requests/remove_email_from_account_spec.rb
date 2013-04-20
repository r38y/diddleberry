require 'spec_helper'

describe "remove email from account" do
  it "lets them do it if more than one" do
    email_one = create(:email, :confirmed)
    user = email_one.user
    email_two = create(:email, :confirmed, user: user)

    login_with_email(email_one)
    visit root_url

    expect {
      within("#email_#{email_one.id}") do
        click_on "×"
      end
    }.to change(user.emails, :count).by(-1)
    page.should have_content("#{email_one.address} has been removed from your account")
    within('.user-emails') do
      page.should_not have_content(email_one.address)
      page.should_not have_content("×")
    end
  end
end
