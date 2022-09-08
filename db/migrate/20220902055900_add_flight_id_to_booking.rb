class AddFlightIdToBooking < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :flight
  end
end
