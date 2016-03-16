require 'rails_helper'

RSpec.describe Booking, :type => :model do

  let!(:earliest_time) { Time.new(2016, 3, 16, 9) }
  let!(:earlier_time) { Time.new(2016, 3, 16, 10) }
  let!(:early_time) { Time.new(2016, 3, 16, 11) }
  let!(:late_time) { Time.new(2016, 3, 16, 14) }
  let!(:later_time) { Time.new(2016, 3, 16, 15) }
  let!(:latest_time) { Time.new(2016, 3, 16, 16) }

  let!(:earliest_booking) { create(:booking, booked_since: earliest_time, booked_until: earlier_time) }
  let!(:earlier_booking) { create(:booking, booked_since: earlier_time, booked_until: early_time) }
  let!(:later_booking) { create(:booking, booked_since: late_time, booked_until: later_time) }
  let!(:latest_booking) { create(:booking, booked_since: later_time, booked_until: latest_time) }

  context "#find_between_datetimes" do
    it "should find Bookings between two date times" do
      bookings = Booking.find_between_datetimes(earlier_time, later_time)

      expect(bookings).to include(earlier_booking)
      expect(bookings).to include(later_booking)
      expect(bookings).not_to include(earliest_booking)
      expect(bookings).not_to include(latest_booking)
    end
  end
end
