class Booking < ActiveRecord::Base
  belongs_to :user

  def self.find_between_datetimes(datetime_since, datetime_until)
    self.where(["booked_since >= ? AND booked_until <= ?", datetime_since, datetime_until])
  end
end
