class CreatePropertyBookings < ActiveRecord::Migration
  def change
    create_table :property_bookings do |t|
      t.integer :property_id
      t.date :booking_start_date
      t.date :booking_end_date
      t.integer :bookers_id

      t.timestamps

    end
  end
end
