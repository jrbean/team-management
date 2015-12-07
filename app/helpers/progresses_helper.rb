module ProgressesHelper

  def progress_list
    @progress = Progress.all
  end
end
