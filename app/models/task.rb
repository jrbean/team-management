class Task < ActiveRecord::Base
  has_many :standards
  has_many :teams, through: :team_tasks
  has_many :team_tasks
  has_many :users, through: :progresses
  has_many :progresses

  def completed
    completed_progress = []
    progresses.each do |p|
     if p.complete?
       completed_progress.push p
     end
    end
    completed_progress.count
  end

end
