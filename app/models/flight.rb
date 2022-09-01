class Flight < ApplicationRecord
    belongs_to :departure_airport, class_name: "Airport"
    belongs_to :arrival_airport, class_name: "Airport"

    def self.found_flights(params)
        Flight.where("DATE(start) = ? AND departure_airport_id = ? AND arrival_airport_id = ?",
            Date.parse(params["flight_date"]), params["departure_airport_id"], params["arrival_airport_id"])
    end
end
