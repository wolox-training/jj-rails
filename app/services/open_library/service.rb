module OpenLibrary
  class Service
    include HTTParty

    def self.get_book(isbn)
      request = HTTParty.get(base_url.to_s,
                             query: { bibkeys: "ISBN:#{isbn}", format: 'json', jscmd: 'data' })

      OpenLibrary::ResponseAdapter.new(request.parsed_response, isbn, request.code)
    end

    def self.base_url
      Rails.application.secrets.open_library_url[:url]
    end
  end
end
