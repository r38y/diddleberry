class EmailWorker
  include SuckerPunch::Worker

  def perform(method, *args)
    Notifier.send(method, *args).deliver
  end
end
