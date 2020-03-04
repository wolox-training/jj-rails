module OpenLibrary
  class ResponseAdapter
    def initialize(body, isbn, status)
      @body = body
      @isbn = isbn
      @status = status
    end

    def book_response
      {
        "isbn": @isbn,
        "title": book_body['title'],
        "subtitle": book_body['subtitle'],
        "number_of_pages": book_body['number_of_pages'],
        "authors": book_body['authors']
      }
    end

    def success?
      @status >= 200 && @status < 400 && @body.present?
    end

    def errors
      { "errors": 'The requested resource was not found' }
    end

    private

    def book_body
      @body["ISBN:#{@isbn}"]
    end
  end
end
