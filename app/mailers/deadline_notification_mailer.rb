class DeadlineNotificationMailer < ApplicationMailer
  default from: Rails.application.credentials.dig(:email_sender, :email)

  def send_email(task)
    @email = task.user.email
    @task = task
    mail(to: @email)
  end
end
