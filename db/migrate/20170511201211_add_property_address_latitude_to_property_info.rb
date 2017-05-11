class AddPropertyAddressLatitudeToPropertyInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :property_infos, :property_address_latitude, :float
  end
end
