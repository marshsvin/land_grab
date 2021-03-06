class UserType < ApplicationRecord
  # Direct associations

  has_many   :property_reviews,
             :foreign_key => "user_id"

  has_many   :property_bookings,
             :foreign_key => "bookers_id"

  has_many   :property_infos,
             :foreign_key => "landowner_id",
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
