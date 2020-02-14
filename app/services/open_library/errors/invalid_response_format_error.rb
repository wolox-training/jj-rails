module OpenLibrary
  module Errors
    class InvalidResponseFormatError < StandardError
      def initialize(msg = 'Invalid response format')
        @msg = msg
      end

      def to_s
        @msg
      end
    end
  end
end
