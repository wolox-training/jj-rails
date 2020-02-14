module OpenLibrary
  class ResponseAdapter
    def self.book_response(response_body, isbn)
      raise Errors::BookNotFound if
        response_body.empty?

      {
        "isbn": isbn,
        "title": response_body["ISBN:#{isbn}"]['title'],
        "subtitle": response_body["ISBN:#{isbn}"]['subtitle'],
        "number_of_pages": response_body["ISBN:#{isbn}"]['number_of_pages'],
        "authors": response_body["ISBN:#{isbn}"]['authors']
      }
    end
  end
end
