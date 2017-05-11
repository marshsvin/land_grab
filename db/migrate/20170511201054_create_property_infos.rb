class CreatePropertyInfos < ActiveRecord::Migration
  def change
    create_table :property_infos do |t|
      t.integer :landowner_id
      t.string :property_address
      t.integer :property_zip_code
      t.string :property_city
      t.string :property_state
      t.float :property_acreage
      t.string :property_description
      t.string :property_pictures

      t.timestamps

    end
  end
end
