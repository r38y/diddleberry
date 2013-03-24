class EmailWorker
  include SuckerPunch::Worker

  def perform(email)
    Notifier.confirm_email(email).deliver
  end
end
