require 'rspec'
require 'hand'

RSpec.describe Hand do
  subject(:hand){Hand.new}
  let(:card){ double(:value => 3, :suit => :spade)}
  # let(:deck){ double(deck)}
  describe "#initialize" do
    it "has a deck of cards" do
      expect(hand.cards).to eq([])
    end
  end

  # describe "#recieve_card" do
  #   it "receives a card" do
  #     allow()
  #   end
  #
  #   it "raises error if hand already has 5 cards" do
  #
  #   end
  #
  # end
end
