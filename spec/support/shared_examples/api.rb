shared_examples 'invalid auth token' do
  it 'returns response with HTTP status 401' do
    expect(response).to have_http_status(401)
  end
end

shared_examples 'success response' do
  it 'returns response with HTTP status 200' do
    expect(response).to have_http_status(200)
  end
end

shared_examples 'record not found' do
  it 'returns response with HTTP status 404' do
    expect(response).to have_http_status(404)
  end
end
