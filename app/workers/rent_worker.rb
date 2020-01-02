class RentWorker
  include Sidekiq::Worker

  def perform(email, title, author, begin_date, end_date)
    RentMailer.with(email, title, author, begin_date, end_date).rent_creation
  end
end
