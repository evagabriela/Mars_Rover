require 'rspec'
require '../lib/grid.rb'

describe Grid do
  # need to check for exceptions (grid empty , grid already taken)
  describe "#available?" do
    let(:grid){Grid.new(6,6)}

    it "return true if the grid is empty" do
      grid.available?(3,3).should eq(true)
    end

    it "raise an error if the grid is already taken" do
      grid.grid[3][3] = "N"
      expect{grid.available?(3,3)}.to raise_error
    end
  end
end