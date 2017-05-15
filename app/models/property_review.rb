class PropertyReview < ApplicationRecord
  # Direct associations

  belongs_to :property,
             :counter_cache => :reviews_count

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
