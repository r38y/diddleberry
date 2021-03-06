class Email < ActiveRecord::Base
  include DeleteProtection

  belongs_to :user
  validates :address, presence: true, uniqueness: true
  before_validation :set_token, on: :create

  def confirmed?
    confirmed_at?
  end

  def confirm!
    touch(:confirmed_at) unless confirmed?
  end

  def deleteable?
    user.emails.count > 1
  end

  private

  def set_token
    self.token = SecureRandom.hex[0, 10]
  end
end
