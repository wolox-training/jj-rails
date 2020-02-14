module OpenLibrary
  class Service
    include HTTParty

    def self.get_book(isbn)
      response = HTTParty.get(base_url.to_s,
                              query: { bibkeys: "ISBN:#{isbn}", format: 'json', jscmd: 'data' })
      OpenLibrary::ResponseAdapter.book_response(response.parsed_response, isbn)
    end

    def self.base_url
      Rails.application.secrets.open_library[:url]
    end
  end
end
