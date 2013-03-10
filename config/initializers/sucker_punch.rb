SuckerPunch.config do
  queue name: :emails, worker: EmailWorker, size: 2
end
