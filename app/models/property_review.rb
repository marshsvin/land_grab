class PropertyReview < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :class_name => "UserType",
             :counter_cache => true

  # Indirect associations

  # Validations

end
