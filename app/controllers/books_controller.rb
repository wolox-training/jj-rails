class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    render_paginated Book.all
  end

  def show
    render json: Book.find(params.require(:id))
  end
end
