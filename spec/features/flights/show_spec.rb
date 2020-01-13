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

    expect(page).to have_content(flight.number)
    expect(page).to have_content(flight.date)
    expect(page).to have_content(flight.time)
    expect(page).to have_content(flight.departure_city)
    expect(page).to have_content(flight.arrival_city)
    expect(page).to have_content("Airline: #{airline.name}")
    expect(page).to have_content("Passengers: #{passenger_1.name} #{passenger_2.name}")
    expect(page).not_to have_content(passenger_3.name)
  end
end
