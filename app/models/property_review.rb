class PropertyReview < ApplicationRecord
  # Direct associations

  belongs_to :property,
             :class_name => "PropertyInfo",
             :counter_cache => :reviews_count

  belongs_to :user,
             :class_name => "UserType",
             :counter_cache => true

  # Indirect associations

  # Validations

end
