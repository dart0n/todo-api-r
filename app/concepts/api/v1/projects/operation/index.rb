module Api::V1::Projects::Operation
  class Index < Trailblazer::Operation
    step :set_projects

    def set_projects(ctx, current_user:, **)
      ctx[:model] = Project.where(user: current_user)
    end
  end
end
