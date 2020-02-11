module OpenLibrary
  class ResponseAdapter
    class << self

      def book_response(response, ISBN)
        raise Errors::InvalidResponseFormatError if
          response['Body'].nil?
        response['Body']
      end
    end
  end
end