class RentMailer < ApplicationMailer
  def rent_creation(email, rent, book)
    @title = book.title
    @author = book.author
    @genre = book.gender
    @begin_date = rent.begin_date
    @end_date = rent.end_date
    mail(to: email, subject: '[Wbooks] New book rent', &:html)
  end
end