shared_context 'Decoded Response Body' do
  let(:response_body) do
    ActiveSupport::JSON.decode(response.body) if response.present? && response.body.present?
  end
end
