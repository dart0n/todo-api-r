module Api::V1::Projects::Operation
  class Create < Trailblazer::Operation
    step :set_model
    step Contract::Build(constant: Api::V1::Projects::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()

    def set_model(ctx, params:, current_user:, **)
      ctx[:model] = Project.new(name: params[:name], user: current_user)
    end
  end
end
