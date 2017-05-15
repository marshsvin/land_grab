class AddPropertyReviewCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :property_reviews_count, :integer
  end
end
