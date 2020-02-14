class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    render_paginated Book.all
  end

  def show
    render json: Book.find(params.require(:id))
  end

  def detailed_book
    render json: OpenLibrary::Service.get_book(params.require(:isbn))
  end
end
