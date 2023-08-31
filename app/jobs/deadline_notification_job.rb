class DeadlineNotificationJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: 1

  def perform(task)
    DeadlineNotificationMailer.send_email(task).deliver
  end
end
