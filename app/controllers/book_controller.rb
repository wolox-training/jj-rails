class BookController < ApplicationController
  include Wor::Paginate
  def index
    render_paginated Book.all, serializer: BookSerializer
  end

  def show
    render json: Book.find(params[:id]), serializer: BookSerializer
  end
end
