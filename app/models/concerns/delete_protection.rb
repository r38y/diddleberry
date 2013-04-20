module DeleteProtection
  extend ActiveSupport::Concern

  included do
    before_destroy ->(record){ record.deleteable? }
  end

  def deleteable?
    true
  end
end
