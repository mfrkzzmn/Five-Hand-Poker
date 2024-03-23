require 'deck'


describe Deck do
  let(:cards) { double("card") }
  before do
    @cards = []
    suit = "spade"
    values = ['2', '3', '4', '5', '6', '7', '8', '9','10', 'J', 'Q', 'K','A']
    @cards.append({'suit':'spade', 'values':values})
  end

  describe "#initialize" do
    it "initialize cards in deck" do
      deck = Deck.new(@cards)
      suit = "spade"
      values = ['2', '3', '4', '5', '6', '7', '8', '9','10', 'J', 'Q', 'K','A']
      result = {'suit':suit, 'values': values}
      expect(deck.get_cards[0]).to eql(result)
    end
  end
end
