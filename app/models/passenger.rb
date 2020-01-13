class Passenger < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :age

  has_many :airline_passengers
  has_many :airlines, through: :airline_passengers

end
