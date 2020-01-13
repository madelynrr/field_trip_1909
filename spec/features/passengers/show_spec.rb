require 'rails_helper'

RSpec.describe "as a visitor" do
  it "can view a passenger's show page and see their name and flights" do
    airline = Airline.create(name: "Southwest")
    flight_1 = airline.flights.create(number: "714",
                                    date: "10/14/19",
                                    time: "10:30 AM",
                                    departure_city: "Tempe",
                                    arrival_city: "Denver")
    flight_2 = airline.flights.create(number: "515",
                                    date: "10/21/19",
                                    time: "12:30 PM",
                                    departure_city: "Denver",
                                    arrival_city: "Tempe")
    passenger_1 = Passenger.create(name: "Bob",
                                   age: 20)
    flight_1.passengers << passenger_1
    flight_2.passengers << passenger_1


    visit "/passengers/#{passenger_1.id}"

    expect(page).to have_content(passenger_1.name)
    expect(page).to have_content("Flights:")
    expect(page).to have_link(flight_1.number)
    click_link "#{flight_2.number}"

    expect(current_path).to eq("/flights/#{flight_2.id}")
  end

  it "can add a flight for a passenger" do
    airline = Airline.create(name: "Southwest")
    flight_1 = airline.flights.create(number: "714",
                                    date: "10/14/19",
                                    time: "10:30 AM",
                                    departure_city: "Tempe",
                                    arrival_city: "Denver")
    # flight_2 = airline.flights.create(number: "515",
    #                                 date: "10/21/19",
    #                                 time: "12:30 PM",
    #                                 departure_city: "Denver",
    #                                 arrival_city: "Tempe")
    passenger_1 = Passenger.create(name: "Bob",
                                   age: 20)

    visit "/passengers/#{passenger_1.id}"

    expect(page).to have_content("Add A Flight")

    fill_in :number, with: flight_1.number

    click_button "Add Flight"

    expect(current_path).to eq("/passengers/#{passenger_1.id}")
    expect(page).to have_link("#{flight_1.number}")
  end
end
