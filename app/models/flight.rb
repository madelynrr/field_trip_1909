class Flight <ApplicationRecord
  validates_presence_of :number, :date, :time, :departure_city, :arrival_city
  belongs_to :airline

  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def all_minors
    passengers.where("age < 18")
  end

  def all_adults
    passengers.where("age >= 18")
  end
end
