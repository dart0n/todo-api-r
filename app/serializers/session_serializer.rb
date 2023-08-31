class SessionSerializer < ApplicationSerializer
  attributes :id, :username, :email, :access_token, :refresh_token
end
