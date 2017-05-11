class AddPropertyInfoCountToUserTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :user_types, :property_infos_count, :integer
  end
end
