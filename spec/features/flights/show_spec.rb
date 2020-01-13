require 'rails_helper'

RSpec.describe "as a visitor" do
  it "can see flight show page" do
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


    visit "/flights/#{flight.id}"

    expect(page).to have_content("Flight Number: #{flight.number}")
    expect(page).to have_content("Date: #{flight.date}")
    expect(page).to have_content("Time: #{flight.time}")
    expect(page).to have_content("Departure City: #{flight.departure_city}")
    expect(page).to have_content("Arrival City: #{flight.arrival_city}")
    expect(page).to have_content("Airline: #{airline.name}")
    expect(page).to have_content("Passengers:")
    expect(page).to have_content(passenger_1.name)
    expect(page).to have_content(passenger_2.name)
    expect(page).not_to have_content(passenger_3.name)
  end

  it "displays number of minors and number of adults on flight" do
    airline = Airline.create(name: "Southwest")
    flight = airline.flights.create(number: "714",
                                    date: "10/14/19",
                                    time: "10:30 AM",
                                    departure_city: "Tempe",
                                    arrival_city: "Denver")
    passenger_1 = Passenger.create(name: "Bob",
                                   age: 16)
    passenger_2 = Passenger.create(name: "Sally",
                                   age: 30)
    passenger_3 = Passenger.create(name: "Billy",
                                   age: 40)
    flight.passengers << [passenger_1, passenger_2, passenger_3]

    visit "/flights/#{flight.id}"

    expect(page).to have_content("Number of Minors: 1")
    expect(page).to have_content("Number of Adults: 2")
  end
end
