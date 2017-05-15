class CreatePropertyReviews < ActiveRecord::Migration
  def change
    create_table :property_reviews do |t|
      t.string :property_review
      t.integer :property_id
      t.integer :user_id

      t.timestamps

    end
  end
end
