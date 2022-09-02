class CreateBookingsPassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings_passengers, id: false do |t|
      t.belongs_to :booking
      t.belongs_to :passenger
    end
  end
end
