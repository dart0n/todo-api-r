module Api::V1
  class TasksController < AuthorizedController
    def index
      result = Api::V1::Tasks::Operation::Index.call(params: params, current_user: current_user)
      render_json(model: result[:model], serializer: TaskSerializer)
    end

    def create
      result = Api::V1::Tasks::Operation::Create.call(params: params, current_user: current_user)
      return render_json(model: result[:model], serializer: TaskSerializer, status: :created) if result.success?

      render_validation_errors(result['result.contract.default']&.errors&.messages)
    end

    def update
      result = Api::V1::Tasks::Operation::Update.call(params: params, current_user: current_user)
      return render_json(model: result[:model], serializer: TaskSerializer) if result.success?

      render_validation_errors(result['result.contract.default']&.errors&.messages)
    end
  end
end
