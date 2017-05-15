class Request < ApplicationRecord
  # Direct associations

  belongs_to :property,
             :counter_cache => :property_bookings_count

  belongs_to :bookers,
             :class_name => "User",
             :foreign_key => "user_id",
             :counter_cache => :property_bookings_count

  # Indirect associations

  # Validations

end
