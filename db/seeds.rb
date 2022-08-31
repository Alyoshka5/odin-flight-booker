# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.delete_all  # don't do in production

airport_codes = ["YVR", "YOW", "NYC", "SEA"]
airport_codes.each do |airport_code|
    Airport.create(airport_code: airport_code)
end

Flight.delete_all
10.times do |i|
    start = rand(1.years).seconds.from_now
    duration = rand(60..360)

    departure_airport_code = airport_codes[rand(0..3)]
    arrival_airport_code = departure_airport_code
    while arrival_airport_code == departure_airport_code
        arrival_airport_code = airport_codes[rand(0..3)]
    end
    departure_airport_id = Airport.where("airport_code = ?", departure_airport_code).first.id
    arrival_airport_id = Airport.where("airport_code = ?", arrival_airport_code).first.id

    Flight.create(start: start, duration: duration, departure_airport_id: departure_airport_id, arrival_airport_id: arrival_airport_id)
end