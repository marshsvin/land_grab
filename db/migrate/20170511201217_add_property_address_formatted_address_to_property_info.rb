class AddPropertyAddressFormattedAddressToPropertyInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :property_infos, :property_address_formatted_address, :string
  end
end
