class Progress < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  belongs_to :team

end
