class AddPropertyBookingCountToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :property_bookings_count, :integer
  end
end
