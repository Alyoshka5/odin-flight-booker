class PassengerMailer < ApplicationMailer
    default from: "alyoshkamyshko@gmail.com"

    def confirmation_email
        @passengers = params[:passenger_ids].map {|p_id| Passenger.find(p_id) }
        @flight = params[:flight]
        @passengers.each do |passenger|
            @passenger = passenger
            mail(to: @passenger.email, subject: "You have a booked flight")
        end
    end
end
