class User < ActiveRecord::Base
  has_many :emails, dependent: :destroy

  def self.from_email(address)
    if email = Email.find_by_address(address)
      email.user
    else
      user = create
      user.emails.create(address: address)
      user
    end
  end
end
