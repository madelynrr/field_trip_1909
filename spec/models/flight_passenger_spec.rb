require 'rails_helper'

RSpec.describe FlightPassenger, type: :model do
  describe "reslationships" do
    it {should belong_to :flight}
    it {should belong_to :passenger}
  end
end
