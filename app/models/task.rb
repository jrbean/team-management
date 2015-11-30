class Task < ActiveRecord::Base
  has_many :standards
  has_many :teams, through: :team_tasks
  has_many :team_tasks
end
