module OpenLibrary
    class Service
        include HTTParty

        def get_book(ISBN)
        Middleman::B2b::ResponseAdapter.user_menu_b2b_response(
            post(
            attempting_to: 'obtain menu options from B2B',
            path: '/TPD/CORP/Usuario/Menu/Obtener/v1_0',
            headers: {
                Authorization: auth_header(Middleman::Auth.new.token),
                'Content-Type' => 'application/json'
            },
            body: body
            ), company.id
        )
        rescue Middleman::Errors::InvalidResponseFormatError
        {
            error: I18n.t('services.middleman.b2b.errors.invalid_format')
        }
        end

        def request(options = {}, &block) # TODO: Remove this when we have the SSL certificate
        validate_method!(options[:method])

        log_attempt(options[:attempting_to])
        resp = HTTParty.send(options[:method], uri(options[:path]),
                                request_parameters(options).merge(verify: false))
        return after_success(resp, options, &block) if resp.success?
        after_error(resp, options)
        end

        private

        def base_url
        Rails.application.secrets.middleman[:base_url]
        end

        def auth_header(token)
        "Bearer #{token}"
        end
    end
end