class AuthorizedController < ApplicationController
  before_action :authorize_access_request!

  private

  def current_user
    @current_user ||= User.find_by(id: payload['user_id'])
  end
end
