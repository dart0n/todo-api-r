class ApplicationController < ActionController::API
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

  def not_authorized
    render json: { error: 'Not authorized' }, status: :unauthorized
  end

  def render_json(model:, serializer:, status: :ok)
    render json: serializer.new(model).serializable_hash.to_json, status: status
  end

  def render_validation_errors(errors)
    render json: { errors: errors }, status: :unprocessable_entity
  end
end
