class User < ApplicationRecord
  # Direct associations

  has_many   :property_reviews

  has_many   :property_bookings,
             :class_name => "Request",
             :foreign_key => "requestors_id"

  has_many   :property_infos,
             :class_name => "Property",
             :foreign_key => "landowner_id",
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
