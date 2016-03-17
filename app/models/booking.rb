class Booking < ActiveRecord::Base
  belongs_to :user

  validates :booked_since, presence: true, uniqueness: true
  validates :booked_until, presence: true, uniqueness: true

  def self.find_between_datetimes(datetime_since, datetime_until)
    self.where(["booked_since >= ? AND booked_until <= ?", datetime_since, datetime_until])
  end

  def booked_since
    read_attribute(:booked_since).to_time.to_s
  end

  def booked_until
    read_attribute(:booked_until).to_time.to_s
  end

  def username
    self.user.email
  end

end
