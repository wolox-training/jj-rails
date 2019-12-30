class RentsController < ApplicationController
  before_action :authenticate_user!

  def index
    render_paginated Rent.all
  end

  def create
    rent = Rent.new(permitted_params)
    if rent.save
      render json: rent, status: :created
    else
      render json: { errors: rent.errors.messages }, status: :unprocessable_entity
    end
  end

  def permitted_params
    params
      .require(:rent)
      .permit(:user_id, :book_id, :begin_date, :end_date)
  end
end
