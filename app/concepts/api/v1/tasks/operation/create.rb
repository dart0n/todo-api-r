module Api::V1::Tasks::Operation
  class Create < Trailblazer::Operation
    step :set_model
    step Contract::Build(constant: Api::V1::Tasks::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()

    def set_model(ctx, params:, current_user:, **)
      ctx[:model] = Task.new(text: params[:text], deadline: params[:deadline], is_done: params[:is_done],
                             user: current_user, project_id: params[:project_id])
    end
  end
end
