class AddPropertyBookingCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :property_bookings_count, :integer
  end
end
