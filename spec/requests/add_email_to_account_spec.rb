require 'spec_helper'

describe "Adding an email to account" do
  it "lets them do it" do
    existing_email = create(:email, :confirmed)
    new_email_address = 'new-email@gmail.com'

    login_with_email(existing_email)
    visit root_url
    fill_in 'email[address]', with: new_email_address
    click_on 'Add'
    open_email(new_email_address)
    new_email = Email.find_by_address(new_email_address)
    current_email.click_link user_sessions_url(new_email.token)

    page.should have_content(new_email.address)
    page.should have_content(existing_email.address)
  end

  it "shows an error message if no email entered" do
    existing_email = create(:email, :confirmed)
    login_with_email(existing_email)
    visit root_url

    fill_in 'email[address]', with: ''
    click_on 'Add'

    page.should have_content("That address is invalid")
  end
end
