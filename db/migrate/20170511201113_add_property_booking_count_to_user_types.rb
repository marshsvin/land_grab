class AddPropertyBookingCountToUserTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :user_types, :property_bookings_count, :integer
  end
end
