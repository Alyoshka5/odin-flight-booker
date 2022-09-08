class BookingsController < ApplicationController
    def new
        @params = params
        @flight = Flight.find(params["flight_id"])
        @num_tickets = params["num_tickets"]
        @booking = Booking.new
        @num_tickets.to_i.times { @booking.passengers.build }
    end
    
    def create
        @flight = Flight.find(params["flight_id"])
        @num_tickets = params["num_tickets"]
        @booking = Booking.new(booking_params())
        @booking.flight = @flight
        @flight.bookings << @booking

        if @booking.save
            redirect_to root_path
        else
            render :new, :unprocessable_entity
        end
    end

    private


    def booking_params
        params.require(:booking).permit(passengers_attributes: [:name, :email])
    end

end
