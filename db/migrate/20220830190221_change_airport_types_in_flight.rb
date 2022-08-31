class ChangeAirportTypesInFlight < ActiveRecord::Migration[7.0]
  def change
    remove_column :flights, :departure_airport
    remove_column :flights, :arrival_airport

    add_reference :flights, :departure_airport
    add_reference :flights, :arrival_airport
  end
end
