class Progress < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  belongs_to :team

  def incomplete
    if
      complete == false
    end
  end

end
