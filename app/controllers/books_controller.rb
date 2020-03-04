class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    render_paginated Book.all
  end

  def show
    render json: Book.find(params.require(:id))
  end

  def detailed_book
    result = OpenLibrary::Service.get_book(params.require(:isbn))
    return render json: result.book_response, status: :ok if result.success?

    render json: result.errors, status: :not_found
  end
end
