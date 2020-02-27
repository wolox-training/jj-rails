class BookSuggestionSerializer < ActiveModel::Serializer
  attributes :id, :synopsis, :price, :author, :title, :url, :editor, :year, :user_id
end
