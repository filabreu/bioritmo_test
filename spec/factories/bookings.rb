FactoryGirl.define do
  factory :booking do
    booked_since "2016-03-16 12:00:00"
    booked_until "2016-03-16 13:00:00"
    user nil
  end
end
