class Task < ActiveRecord::Base
  belongs_to :user, through: :user_tasks
  has_many :conditions
  has_one :standard
end
