module Api::V1::Tasks::Operation
  class Update < Trailblazer::Operation
    step Model(Task, :find)
    step Contract::Build(constant: Api::V1::Tasks::Contract::Create)
    step Contract::Validate()
    step :deadline_changed?, Output(:success) => Id(:send_deadline_notification),
                             Output(:failure) => End(:success)
    step :send_deadline_notification
    step Contract::Persist()

    def deadline_changed?(_ctx, params:, model:, **)
      params[:deadline].present? && model.deadline != DateTime.parse(params[:deadline])
    end

    def send_deadline_notification(_ctx, params:, model:, **)
      datetime_before_deadline = DateTime.parse(params[:deadline]) - Task::TIME_DEADLINE_NOTIFICATION
      DeadlineNotificationJob.set(wait_until: datetime_before_deadline).perform_later(model)
    end
  end
end
