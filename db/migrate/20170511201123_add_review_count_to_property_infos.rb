class AddReviewCountToPropertyInfos < ActiveRecord::Migration[5.0]
  def change
    add_column :property_infos, :reviews_count, :integer
  end
end
