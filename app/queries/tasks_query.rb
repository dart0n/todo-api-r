class TasksQuery
  def initialize(param:, user:)
    @param = param
    @scope = Task.where(user: user)
  end

  def call
    case @param
    when 'deadline' then by_deadline
    when 'done'     then by_done
    when 'week'     then for_week
    else @scope
    end
  end

  private

  def by_deadline
    @scope.where.not(deadline: nil)
  end

  def by_done
    @scope.where(is_done: true)
  end

  def for_week
    @scope.where(deadline: Time.zone.today.all_week)
  end
end
