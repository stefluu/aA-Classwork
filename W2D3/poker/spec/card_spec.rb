require 'rspec'
require 'card'

RSpec.describe "Card" do
  subject(:card){Card.new(:heart, 12)} # Q

  describe "#initialize" do
    it "has a suit" do
      expect(card.suit).to eq(:heart)
    end

    it "has a value" do
      expect(card.value).to eq(12)
    end
  end

  # describe "#==" do
  #   let(:other_card){Card.new(:spade, 2)}
  #   let(:same_suit_card){Card.new(:heart, 7)}
  #   let(:same_values_card){Card.new(:clover, 12)}
  #
  #   it "recognizes when another card matches the same suit" do
  #     expect(card==other_card).to be_falsy
  #     expect(card==)
  #   end
  # end

end
