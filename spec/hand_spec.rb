require 'hand'


describe Hand do
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
  end

  describe "#high_card" do
    it "first hand is greater" do
      hand = Hand.new(@cards)
      hand1 = []
      hand2 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values1 = ['A', 'J', '9', '6', '10']
      values2 = ['A', 'J', '4', '7', '8']

      hand1.append({'suit':suits[1], 'value': values1[0]})
      hand1.append({'suit':suits[0], 'value': values1[1]})
      hand1.append({'suit':suits[2], 'value': values1[2]})
      hand1.append({'suit':suits[0], 'value': values1[3]})
      hand1.append({'suit':suits[3], 'value': values1[4]})

      hand2.append({'suit':suits[0], 'value': values2[0]})
      hand2.append({'suit':suits[1], 'value': values2[1]})
      hand2.append({'suit':suits[0], 'value': values2[2]})
      hand2.append({'suit':suits[3], 'value': values2[3]})
      hand2.append({'suit':suits[2], 'value': values2[4]})

      expect(hand.check_high_hand(hand1, hand2)).to eql(1)
    end

    it "second hand is greater" do
      hand = Hand.new(@cards)
      hand1 = []
      hand2 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values1 = ['A', 'J', '8', '6', '7']
      values2 = ['A', 'K', '4', '3', '2']

      hand1.append({'suit':suits[1], 'value': values1[0]})
      hand1.append({'suit':suits[0], 'value': values1[1]})
      hand1.append({'suit':suits[2], 'value': values1[2]})
      hand1.append({'suit':suits[0], 'value': values1[3]})
      hand1.append({'suit':suits[3], 'value': values1[4]})

      hand2.append({'suit':suits[0], 'value': values2[0]})
      hand2.append({'suit':suits[1], 'value': values2[1]})
      hand2.append({'suit':suits[0], 'value': values2[2]})
      hand2.append({'suit':suits[3], 'value': values2[3]})
      hand2.append({'suit':suits[2], 'value': values2[4]})

      expect(hand.check_high_hand(hand1, hand2)).to eql(-1)
    end

    it "both hands are equal" do
      hand = Hand.new(@cards)
      hand1 = []
      hand2 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values1 = ['A', 'J', '8', '6', '7']
      values2 = ['A', 'J', '8', '6', '7']

      hand1.append({'suit':suits[1], 'value': values1[0]})
      hand1.append({'suit':suits[0], 'value': values1[1]})
      hand1.append({'suit':suits[2], 'value': values1[2]})
      hand1.append({'suit':suits[0], 'value': values1[3]})
      hand1.append({'suit':suits[3], 'value': values1[4]})

      hand2.append({'suit':suits[0], 'value': values2[0]})
      hand2.append({'suit':suits[1], 'value': values2[1]})
      hand2.append({'suit':suits[0], 'value': values2[2]})
      hand2.append({'suit':suits[3], 'value': values2[3]})
      hand2.append({'suit':suits[2], 'value': values2[4]})

      expect(hand.check_high_hand(hand1, hand2)).to eql(0)
    end

  end

end
