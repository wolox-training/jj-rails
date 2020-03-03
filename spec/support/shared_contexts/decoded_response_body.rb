shared_context 'with a decoded response body' do
  let(:response_body) do
    ActiveSupport::JSON.decode(response.body) if response.present? && response.body.present?
  end
end
