desc 'Send email when deadline is approaching'
task deadline_notification: :environment do
  tasks = Task.where(deadline: Date.tomorrow.all_day)

  unless tasks.empty?
    tasks.each do |task|
      DeadlineNotificationJob.perform_later(task)
    end
  end
end
