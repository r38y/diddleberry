class Email < ActiveRecord::Base
  belongs_to :user
  validates :address, presence: true, uniqueness: true
  before_validation :set_confirmation_token, on: :create

  def confirmed?
    confirmed_at?
  end

  def confirm!
    set_confirmation_token
    self.confirmed_at = Time.now unless confirmed?
    save!
  end

  private

  def set_confirmation_token
    self.confirmation_token = SecureRandom.hex[0, 10]
  end
end
