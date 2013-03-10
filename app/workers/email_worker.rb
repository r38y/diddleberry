class EmailWorker
  include SuckerPunch::Worker

  def perform(email)
    ActiveRecord::Base.connection_pool.with_connection do
      Notifier.confirm_email(email).deliver
    end
  end
end
