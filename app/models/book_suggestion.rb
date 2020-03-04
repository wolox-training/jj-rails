class BookSuggestion < ApplicationRecord
  validates :author, :title, :url, :editor, :year, presence: true
end
