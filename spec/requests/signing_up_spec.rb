require 'spec_helper'

describe "Signing up" do
  it "lets them do it" do
    visit root_url
    fill_in 'email', with: 'bob@bob.com'
    click_on 'Submit'
    page.should have_content('Please check bob@bob.com for a link to log in.')
    open_email('bob@bob.com')
    confirmable_email = Email.find_by_address('bob@bob.com')
    current_email.click_link user_sessions_url(confirmable_email.confirmation_token)
    fill_in 'user[name]', with: 'Bob Johnson'
    click_on 'Submit'
    page.should have_content('Bob Johnson')
    page.should have_content('bob@bob.com')
  end
end
