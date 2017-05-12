class AddPropertyInfoCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :property_infos_count, :integer
  end
end
