class AddReviewCountToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :reviews_count, :integer
  end
end
