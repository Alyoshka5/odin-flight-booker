class FlightsController < ApplicationController

    def index
        @airport_options = Airport.all.map {|airport| [airport.airport_code, airport.id] }
        @num_ticket_options = (1..4).each {|ticket_amount| [ticket_amount, ticket_amount] }
        @flight_date_options = Flight.all.map {|flight| [flight.start.strftime("%d/%m/%Y"), flight.start.strftime("%Y%m%d")] }
    end
end
