class PropertyInfo < ApplicationRecord
  mount_uploader :property_pictures, PropertyPictureUploader

  # Direct associations

  has_many   :reviews,
             :class_name => "PropertyReview",
             :foreign_key => "property_id"

  has_many   :property_bookings,
             :foreign_key => "property_id"

  belongs_to :landowner,
             :class_name => "UserType",
             :counter_cache => true

  # Indirect associations

  # Validations

end
