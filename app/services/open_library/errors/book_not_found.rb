module OpenLibrary
  module Errors
    class BookNotFound < StandardError
      def initialize(message = 'The requested resource was not found')
        @message = message
      end

      def to_s
        @message
      end
    end
  end
end
