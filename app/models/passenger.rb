class Passenger < ApplicationRecord
    has_and_belongs_to_many :bookings, inverse_of: :booking

end
