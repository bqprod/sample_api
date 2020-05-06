module ApiRequestsHelpers
  def valid_auth_header(user = nil)
    user = create(:user) unless user
    { "Authorization": "#{user.id}" }
  end
end
