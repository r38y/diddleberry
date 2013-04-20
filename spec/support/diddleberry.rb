require 'capybara/email/rspec'
require 'sucker_punch/testing/inline'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Shoulda::Matchers::ActionController
  config.include Shoulda::Matchers::ActionMailer
  config.include Capybara::DSL, type: :request

  config.before(:all) { DeferredGarbageCollection.start }
  config.after(:all) { DeferredGarbageCollection.reconsider }
end
