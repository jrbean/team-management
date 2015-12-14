class CompletionChart

  def initialize(task, team)
    @task = task
    @team = team
  end

  def progress
    @progress ||= Progress.where(task_id: @task.id, team_id: @team.id).group(:complete).count
  end

  def to_js
    { 'Complete' => progress[true], 'Incomplete' => progress[false] }
  end
end
