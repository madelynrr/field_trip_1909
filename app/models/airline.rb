class Airline <ApplicationRecord
  validates_presence_of :name
  has_many :flights

  has_many :airline_passengers
  has_many :passengers, through: :airline_passengers
end
