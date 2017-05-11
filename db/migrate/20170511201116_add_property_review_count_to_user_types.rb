class AddPropertyReviewCountToUserTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :user_types, :property_reviews_count, :integer
  end
end
