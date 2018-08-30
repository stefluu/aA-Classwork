require 'rspec'
require 'deck'

RSpec.describe Deck do
  subject(:deck){Deck.new}
  describe "#initialize" do
    it "has a deck of cards" do
      expect(deck.cards).to eq([])
    end
  end

  before(:each){ deck.create_deck }
  describe "#create_deck" do
    it "populates the deck with correct number of unique cards" do
      expect(deck.cards.length).to eq(52)
      expect(deck.cards).to eq(deck.cards.uniq)
    end
  end

  describe "#shuffle!" do
    it "shuffles the cards and retains the same cards" do
      original_deck = Deck.new
      original_deck.create_deck
      deck.shuffle!
      expect(deck.cards.length).to eq(52)
      expect(deck.cards).to eq(deck.cards.uniq)
      expect(original_deck.cards).to not_eq(deck.cards)
    end
  end

  describe "#draw!" do
    it "draws a card from the deck" do
      expect(deck.draw!).to be_a(Card)
      previous_len = deck.cards.length
      deck.draw!
      expect(deck.cards.length).to eq(previous_len - 1)
    end
  end
end
