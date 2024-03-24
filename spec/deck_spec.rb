require 'deck'


describe Deck do
  let(:cards) { double("card") }
  before do
    @cards = []
    suits = ["spade", "hearts", "club", "diamond"]
    values = ['2', '3', '4', '5', '6', '7', '8', '9','10', 'J', 'Q', 'K','A']
    suits.each do |suit|
      values.each do |value|
        @cards.append({'suit':suit, 'value':value})
      end
    end
    # puts @cards
  end

  describe "#shuffle_cards" do
    it "suffle cards in deck" do
      deck = Deck.new(@cards)
      suit = "spade"
      value = '2'
      result = {'suit':suit, 'value': value}
      expect(deck.shuffle_cards[0]).not_to eql(result)
    end
  end

  describe "#deal_cards" do
    it "deal cards in deck" do
      deck = Deck.new(@cards)
      shuffled_cards = deck.shuffle_cards()
      {:player=>"1", :cards=>[{:suit=>"hearts", :value=>"10"}, {:suit=>"spade", :value=>"9"}, {:suit=>"hearts", :value=>"Q"}, {:suit=>"diamond", :value=>"7"}, {:suit=>"diamond", :value=>"10"}]}
      player = "1"
      cards = []
      cards.append(shuffled_cards[0])
      cards.append(shuffled_cards[4])
      cards.append(shuffled_cards[8])
      cards.append(shuffled_cards[12])
      cards.append(shuffled_cards[16])
      result = {'player':player, 'cards': cards}
      expect(deck.deal_cards(shuffled_cards)[0]).to eql(result)
    end
  end

end
