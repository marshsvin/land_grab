class PropertyInfo < ApplicationRecord
  before_validation :geocode_property_address

  def geocode_property_address
    if self.property_address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.property_address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.property_address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.property_address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.property_address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
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
