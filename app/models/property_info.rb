class PropertyInfo < ApplicationRecord
  # Direct associations

  has_many   :property_bookings,
             :foreign_key => "property_id"

  belongs_to :landowner,
             :class_name => "UserType",
             :counter_cache => true

  # Indirect associations

  # Validations

end
