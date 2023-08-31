class TaskSerializer < ApplicationSerializer
  attributes :text, :deadline, :is_done, :project_id
end
