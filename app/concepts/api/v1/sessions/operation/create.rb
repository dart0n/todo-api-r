module Api::V1::Sessions::Operation
  class Create < Trailblazer::Operation
    step :authenticate
    step :set_tokens

    def authenticate(ctx, params:, **)
      user = User.find_by(username: params[:username])
      return ctx[:model] = user if user&.authenticate(params[:password])

      ctx[:errors] = I18n.t('errors.session.wrong_credentials')
      false
    end

    def set_tokens(ctx, model:, **)
      payload = { user_id: model.id }
      session = JWTSessions::Session.new(payload: payload, refresh_payload: payload).login
      ctx[:data] = {
        id: model.id,
        username: model.username,
        access_token: session[:access],
        refresh_token: session[:refresh]
      }
    end
  end
end
