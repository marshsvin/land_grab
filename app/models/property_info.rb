class PropertyInfo < ApplicationRecord
  # Direct associations

  belongs_to :landowner,
             :class_name => "UserType",
             :counter_cache => true

  # Indirect associations

  # Validations

end
