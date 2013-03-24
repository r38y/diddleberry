module Diddleberry
  def self.setup_sucker_punch
    SuckerPunch.config do
      queue name: :emails, worker: EmailWorker, workers: 2
    end
  end
end
