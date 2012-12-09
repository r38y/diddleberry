class User < ActiveRecord::Base
  has_many :emails, dependent: :destroy

  def self.from_email(address)
    if email = Email.find_by_address(address)
      [ email.user, email ]
    else
      user = create
      email = user.emails.create(address: address)
      [ user, email ]
    end
  end
end
