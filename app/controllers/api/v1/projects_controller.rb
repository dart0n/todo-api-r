module Api::V1
  class ProjectsController < AuthorizedController
    def index
      result = Api::V1::Projects::Operation::Index.call(params: params, current_user: current_user)
      render_json(model: result[:model], serializer: ProjectSerializer)
    end

    def create
      result = Api::V1::Projects::Operation::Create.call(params: params, current_user: current_user)
      return render_json(model: result[:model], serializer: ProjectSerializer, status: :created) if result.success?

      render_validation_errors(result['result.contract.default']&.errors&.messages)
    end
  end
end
