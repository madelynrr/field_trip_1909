require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'validations' do
    it {should validate_presence_of :number}
    it {should validate_presence_of :date}
    it {should validate_presence_of :time}
    it {should validate_presence_of :departure_city}
    it {should validate_presence_of :arrival_city}
  end

  describe 'relationships' do
    it {should belong_to :airline}
    it {should have_many :flight_passengers}
    it {should have_many(:passengers).through(:flight_passengers)}
  end

  describe "methods" do
    it ".all_minors" do
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

      expect(flight.all_minors).to eq([passenger_1])
    end

    it ".number_of_adults" do
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

      expect(flight.number_of_adults).to eq([passenger_2, passenger_3])
    end
  end
end
