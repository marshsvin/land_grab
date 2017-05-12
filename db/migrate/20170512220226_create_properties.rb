class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :landowner_id
      t.string :address
      t.integer :zip_code
      t.string :city
      t.string :state
      t.float :acreage
      t.string :description
      t.string :property_pictures

      t.timestamps

    end
  end
end
