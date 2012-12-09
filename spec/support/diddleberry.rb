require 'capybara/email/rspec'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Shoulda::Matchers::ActionController
  config.include Shoulda::Matchers::ActionMailer
  config.include Capybara::DSL, type: :request
end
