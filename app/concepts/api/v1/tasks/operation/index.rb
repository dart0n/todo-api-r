module Api::V1::Tasks::Operation
  class Index < Trailblazer::Operation
    step :set_tasks

    def set_tasks(ctx, params:, current_user:, **)
      ctx[:model] = TasksQuery.new(param: params[:show], user: current_user).call
    end
  end
end
