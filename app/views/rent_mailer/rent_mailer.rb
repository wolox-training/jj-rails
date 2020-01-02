class RentMailer < ApplicationMailer
  default from: 'notifications@wbooks.com'

  def rent_creation
    @title = params[:title]
    @author = params[:author]
    @genre = params[:genre]
    @begin_date = params[:begin_date]
    @end_date = params[:end_date]
    mail(to: params[:email], subject: '[Wbooks] New kook rent')
  end
end
