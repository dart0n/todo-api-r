module Api::V1
  class SessionsController < ApplicationController
    def create
      result = Api::V1::Sessions::Operation::Create.call(params: params)
      return render json: { data: result[:data] } if result.success?

      render json: { errors: result[:errors] }, status: :unprocessable_entity
    end

    def destroy
      authorize_refresh_request!
      result = Api::V1::Sessions::Operation::Destroy.call(found_token: found_token)
      return head :no_content if result.success?

      render json: { errors: result[:errors] }, status: :unprocessable_entity
    end
  end
end
