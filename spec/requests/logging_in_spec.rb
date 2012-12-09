require 'spec_helper'

describe "Logging in" do
  it "lets them do it" do
    existing_email = create(:email, :confirmed)
    visit root_url
    fill_in 'email', with: existing_email.address
    click_on 'Submit'
    open_email(existing_email.address)
    current_email.click_link user_sessions_url(existing_email.confirmation_token)
    fill_in 'user[name]', with: 'Bob Johnson'
    click_on 'Submit'
    page.should have_content('Bob Johnson')
    page.should have_content(existing_email.address)
  end

  it "works when the user already has a name" do
    existing_email = create(:email, :confirmed)
    user = existing_email.user
    user.name = "Bobby"
    user.save
    visit root_url

    fill_in 'email', with: existing_email.address
    click_on 'Submit'
    open_email(existing_email.address)
    current_email.click_link user_sessions_url(existing_email.confirmation_token)

    page.should have_content(user.name)
    page.should have_content(existing_email.address)
  end
end
