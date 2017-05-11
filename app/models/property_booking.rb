class PropertyBooking < ApplicationRecord
  # Direct associations

  belongs_to :bookers,
             :class_name => "UserType",
             :counter_cache => true

  # Indirect associations

  # Validations

end
