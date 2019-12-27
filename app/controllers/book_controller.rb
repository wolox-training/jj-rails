class BookController < ApplicationController
  include Wor::Paginate

  before_action :authenticate_user!

  def index
    render_paginated Book.all, each_serializer: BookSerializer
  end

  def show
    render json: Book.find(params[:id]), serializer: BookSerializer
  end
end
