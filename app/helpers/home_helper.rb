module HomeHelper

  def current_week
    Date.today.beginning_of_week..Date.today.end_of_week - 2
  end

  def booking_hours
    6..23
  end

  def booking_datetime(date, hour)
    Time.new(date.year, date.month, date.day, hour)
  end

  def number_to_hour(hour)
    "%02d:00" % hour
  end

end
