require 'rails_helper'

RSpec.describe AirlinePassenger, type: :model do
  describe "relationships" do
    it {should belong_to :airline}
    it {should belong_to :passenger}
  end
end
