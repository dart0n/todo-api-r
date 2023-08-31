module Api::V1
  class UsersController < ApplicationController
    def create
      result = Api::V1::Users::Operation::Create.call(params: params)
      return render_json(model: result[:model], serializer: UserSerializer, status: :created) if result.success?

      render json: { errors: result['result.contract.default']&.errors&.messages }, status: :unprocessable_entity
    end
  end
end
