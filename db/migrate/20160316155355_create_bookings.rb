class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :booked_since
      t.datetime :booked_until
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
