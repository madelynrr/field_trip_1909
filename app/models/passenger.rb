class Passenger < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :age
  
end