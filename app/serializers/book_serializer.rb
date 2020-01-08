class BookSerializer < ActiveModel::Serializer
  attributes :id, :genre, :author, :image, :title, :editor, :year
end
