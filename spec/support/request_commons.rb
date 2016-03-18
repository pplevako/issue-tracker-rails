shared_context 'json headers' do
  def json_headers
    {
        'ACCEPT': 'application/json',     # This is what Rails 4 accepts
        'HTTP_ACCEPT': 'application/json' # This is what Rails 3 accepts
    }
  end
end
