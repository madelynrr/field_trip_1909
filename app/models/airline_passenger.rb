class AirlinePassenger < ApplicationRecord

  belongs_to :airline
  belongs_to :passenger

end
