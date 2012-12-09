class User < ActiveRecord::Base
  has_many :emails, dependent: :destroy

  def self.from_email(email)

  end
end
