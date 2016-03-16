module HomeHelper

  def current_week
    Date.today.beginning_of_week..Date.today.end_of_week - 2
  end

end
