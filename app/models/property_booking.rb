class PropertyBooking < ApplicationRecord
  # Direct associations

  belongs_to :property,
             :class_name => "PropertyInfo",
             :counter_cache => true

  belongs_to :bookers,
             :class_name => "UserType",
             :counter_cache => true

  # Indirect associations

  # Validations

end
