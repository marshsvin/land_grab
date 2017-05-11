class AddPropertyBookingCountToPropertyInfos < ActiveRecord::Migration[5.0]
  def change
    add_column :property_infos, :property_bookings_count, :integer
  end
end
