class BookSuggestionsController < ApplicationController
  def create
    book = BookSuggestion.new(permitted_params.merge(user_id: current_user&.id))
    if book.save
      render json: book, status: :created
    else
      render json: { errors: book.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def permitted_params
    params
      .require(:book_suggestion)
      .permit(:synopsis, :price, :title, :author, :url, :editor, :year)
  end
end
