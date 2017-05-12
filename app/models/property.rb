class Property < ApplicationRecord
  before_validation :geocode_address

  def geocode_address
    if self.address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :property_pictures, PropertyPictureUploader

  # Direct associations

  has_many   :reviews,
             :class_name => "PropertyReview"

  has_many   :property_bookings,
             :class_name => "Request"

  belongs_to :landowner,
             :class_name => "User",
             :counter_cache => :property_infos_count

  # Indirect associations

  # Validations

end
