class Email < ActiveRecord::Base
  belongs_to :user
  validates :address, presence: true, uniqueness: true

  def confirmed?
    confirmed_at?
  end

  def confirm!
    touch(:confirmed_at) unless confirmed?
  end
end
