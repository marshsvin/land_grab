class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :user_id
      t.string :address
      t.integer :zip_code
      t.string :city
      t.string :state
      t.float :acreage
      t.string :description
      t.integer :price

      t.timestamps

    end
  end
end
