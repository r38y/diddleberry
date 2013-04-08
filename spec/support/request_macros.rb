def login_with_email(email)
  email = Email.find_by_address(email) if email.is_a?(String)
  visit root_url
  fill_in 'email', with: email.address
  click_on 'Submit'
  open_email(email.address)
  current_email.click_link user_sessions_url(email.token)
  fill_in 'user[name]', with: 'Bob Johnson'
  click_on 'Submit'
  email.user
end

