class RentsController < ApplicationController
  before_action :authenticate_user!, :set_locale

  def index
    render_paginated current_user.rents.includes(:book).all
  end

  def create
    rent = Rent.new(permitted_params)
    if rent.save
      RentMailer.rent_creation(current_user.email, rent, rent.book).deliver_later
      render json: rent, status: :created
    else
      render json: { errors: rent.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def set_locale
    I18n.locale = current_user.locale || I18n.default_locale
  end

  def permitted_params
    params
      .require(:rent)
      .permit(:book_id, :begin_date, :end_date)
      .merge(user_id: current_user.id)
  end
end
