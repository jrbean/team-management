module ProgressesHelper

  def list_progress
    @progress = Progress.all
  end
end
