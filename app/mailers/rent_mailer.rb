class RentMailer < ApplicationMailer
  def rent_creation(email, rent, book)
    @title = book.title
    @author = book.author
    @genre = book.genre
    @begin_date = rent.begin_date
    @end_date = rent.end_date
    mail(to: email, subject: t('rent_mailer.subject'), &:html)
  end
end
