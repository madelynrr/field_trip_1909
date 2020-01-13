# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airline = Airline.create(name: "Southwest")
flight = airline.flights.create(number: "714",
                                date: "10/14/19",
                                time: "10:30 AM",
                                departure_city: "Tempe",
                                arrival_city: "Denver")
passenger_1 = Passenger.create(name: "Bob",
                               age: 20)
passenger_2 = Passenger.create(name: "Sally",
                               age: 30)
passenger_3 = Passenger.create(name: "Billy",
                               age: 40)
flight.passengers << [passenger_1, passenger_2]
