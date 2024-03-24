require 'hand'


describe Hand do
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

  describe "#get_hand_card_index" do
    it "get hand card index array" do
      hand = Hand.new(@cards)

      values = ['2', '3', '4', '5', '6', '7', '8', '9','10', 'J', 'Q', 'K','A']
      hand1 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values1 = ['A', 'J', '8', '6', '7']


      hand1.append({'suit':suits[1], 'value': values1[0]})
      hand1.append({'suit':suits[0], 'value': values1[1]})
      hand1.append({'suit':suits[2], 'value': values1[2]})
      hand1.append({'suit':suits[0], 'value': values1[3]})
      hand1.append({'suit':suits[3], 'value': values1[4]})

      hand1_index = [12, 9, 6, 5, 4]

      expect(hand.get_hand_index_array(hand1)).to match_array(hand1_index)
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
  end

  describe "#single_pair" do
    it "check if single pair exists" do
      hand = Hand.new(@cards)
      hand1 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values = ['A', 'A', '9', '6', '10']

      hand1.append({'suit':suits[1], 'value': values[0]})
      hand1.append({'suit':suits[0], 'value': values[1]})
      hand1.append({'suit':suits[2], 'value': values[2]})
      hand1.append({'suit':suits[0], 'value': values[3]})
      hand1.append({'suit':suits[3], 'value': values[4]})

      expect(hand.check_single_pair(hand1)).to eql(1)
    end

    it "check if single pair not exists by all different card values" do
      hand = Hand.new(@cards)
      hand1 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values = ['A', '2', '9', '6', '10']

      hand1.append({'suit':suits[1], 'value': values[0]})
      hand1.append({'suit':suits[0], 'value': values[1]})
      hand1.append({'suit':suits[2], 'value': values[2]})
      hand1.append({'suit':suits[0], 'value': values[3]})
      hand1.append({'suit':suits[3], 'value': values[4]})

      expect(hand.check_single_pair(hand1)).to eql(0)
    end

    it "check if single pair exists by having double pairs" do
      hand = Hand.new(@cards)
      hand1 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values = ['A', '2', 'A', '2', '10']

      hand1.append({'suit':suits[1], 'value': values[0]})
      hand1.append({'suit':suits[0], 'value': values[1]})
      hand1.append({'suit':suits[2], 'value': values[2]})
      hand1.append({'suit':suits[0], 'value': values[3]})
      hand1.append({'suit':suits[3], 'value': values[4]})

      expect(hand.check_single_pair(hand1)).to eql(0)
    end

    it "check if single pair not exists by having three of a kind" do
      hand = Hand.new(@cards)
      hand1 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values = ['A', '2', '6', '6', '6']

      hand1.append({'suit':suits[1], 'value': values[0]})
      hand1.append({'suit':suits[0], 'value': values[1]})
      hand1.append({'suit':suits[2], 'value': values[2]})
      hand1.append({'suit':suits[0], 'value': values[3]})
      hand1.append({'suit':suits[3], 'value': values[4]})

      expect(hand.check_single_pair(hand1)).to eql(0)
    end

    it "check if single pair not exists by having four of a kind" do
      hand = Hand.new(@cards)
      hand1 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values = ['6', 'A', '6', '6', '6']

      hand1.append({'suit':suits[1], 'value': values[0]})
      hand1.append({'suit':suits[0], 'value': values[1]})
      hand1.append({'suit':suits[2], 'value': values[2]})
      hand1.append({'suit':suits[0], 'value': values[3]})
      hand1.append({'suit':suits[3], 'value': values[4]})

      expect(hand.check_single_pair(hand1)).to eql(0)
    end
  end

  describe "#double_pairs" do
    it "check if double pair exists" do
      hand = Hand.new(@cards)
      hand1 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values = ['A', 'A', '9', '9', '10']

      hand1.append({'suit':suits[1], 'value': values[0]})
      hand1.append({'suit':suits[0], 'value': values[1]})
      hand1.append({'suit':suits[2], 'value': values[2]})
      hand1.append({'suit':suits[0], 'value': values[3]})
      hand1.append({'suit':suits[3], 'value': values[4]})

      expect(hand.check_double_pairs(hand1)).to eql(1)
    end

    it "check if double pairs not exists by all different card values" do
      hand = Hand.new(@cards)
      hand1 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values = ['A', '2', '9', '6', '10']

      hand1.append({'suit':suits[1], 'value': values[0]})
      hand1.append({'suit':suits[0], 'value': values[1]})
      hand1.append({'suit':suits[2], 'value': values[2]})
      hand1.append({'suit':suits[0], 'value': values[3]})
      hand1.append({'suit':suits[3], 'value': values[4]})

      expect(hand.check_double_pairs(hand1)).to eql(0)
    end

    it "check if double pairs exists by having single pair" do
      hand = Hand.new(@cards)
      hand1 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values = ['A', '2', 'K', '2', '10']

      hand1.append({'suit':suits[1], 'value': values[0]})
      hand1.append({'suit':suits[0], 'value': values[1]})
      hand1.append({'suit':suits[2], 'value': values[2]})
      hand1.append({'suit':suits[0], 'value': values[3]})
      hand1.append({'suit':suits[3], 'value': values[4]})

      expect(hand.check_double_pairs(hand1)).to eql(0)
    end

    it "check if double pairs not exists by having three of a kind" do
      hand = Hand.new(@cards)
      hand1 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values = ['A', '2', '6', '6', '6']

      hand1.append({'suit':suits[1], 'value': values[0]})
      hand1.append({'suit':suits[0], 'value': values[1]})
      hand1.append({'suit':suits[2], 'value': values[2]})
      hand1.append({'suit':suits[0], 'value': values[3]})
      hand1.append({'suit':suits[3], 'value': values[4]})

      expect(hand.check_double_pairs(hand1)).to eql(0)
    end

    it "check if double pair not exists by having four of a kind" do
      hand = Hand.new(@cards)
      hand1 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values = ['6', 'A', '6', '6', '6']

      hand1.append({'suit':suits[1], 'value': values[0]})
      hand1.append({'suit':suits[0], 'value': values[1]})
      hand1.append({'suit':suits[2], 'value': values[2]})
      hand1.append({'suit':suits[0], 'value': values[3]})
      hand1.append({'suit':suits[3], 'value': values[4]})

      expect(hand.check_double_pairs(hand1)).to eql(0)
    end
  end

  describe "#three_of_a_kind" do
    it "check if three of a kind exists if there is a double pair" do
      hand = Hand.new(@cards)
      hand1 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values = ['A', 'A', '9', '9', '10']

      hand1.append({'suit':suits[1], 'value': values[0]})
      hand1.append({'suit':suits[0], 'value': values[1]})
      hand1.append({'suit':suits[2], 'value': values[2]})
      hand1.append({'suit':suits[0], 'value': values[3]})
      hand1.append({'suit':suits[3], 'value': values[4]})

      expect(hand.check_three_of_a_kind(hand1)).to eql(0)
    end

    it "check if three of a kind exists if there is all different card values" do
      hand = Hand.new(@cards)
      hand1 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values = ['A', '2', '9', '6', '10']

      hand1.append({'suit':suits[1], 'value': values[0]})
      hand1.append({'suit':suits[0], 'value': values[1]})
      hand1.append({'suit':suits[2], 'value': values[2]})
      hand1.append({'suit':suits[0], 'value': values[3]})
      hand1.append({'suit':suits[3], 'value': values[4]})

      expect(hand.check_three_of_a_kind(hand1)).to eql(0)
    end

    it "check if three of a kind exists if there is a single pair" do
      hand = Hand.new(@cards)
      hand1 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values = ['A', '2', 'K', '2', '10']

      hand1.append({'suit':suits[1], 'value': values[0]})
      hand1.append({'suit':suits[0], 'value': values[1]})
      hand1.append({'suit':suits[2], 'value': values[2]})
      hand1.append({'suit':suits[0], 'value': values[3]})
      hand1.append({'suit':suits[3], 'value': values[4]})

      expect(hand.check_three_of_a_kind(hand1)).to eql(0)
    end

    it "check if three of a kind exists if there is a three of a kind" do
      hand = Hand.new(@cards)
      hand1 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values = ['A', '2', '6', '6', '6']

      hand1.append({'suit':suits[1], 'value': values[0]})
      hand1.append({'suit':suits[0], 'value': values[1]})
      hand1.append({'suit':suits[2], 'value': values[2]})
      hand1.append({'suit':suits[0], 'value': values[3]})
      hand1.append({'suit':suits[3], 'value': values[4]})

      expect(hand.check_three_of_a_kind(hand1)).to eql(1)
    end

    it "check if three of a kind exists if there is a four of a kind" do
      hand = Hand.new(@cards)
      hand1 = []
      suits = ["spade", "hearts", "club", "diamond"]
      values = ['6', 'A', '6', '6', '6']

      hand1.append({'suit':suits[1], 'value': values[0]})
      hand1.append({'suit':suits[0], 'value': values[1]})
      hand1.append({'suit':suits[2], 'value': values[2]})
      hand1.append({'suit':suits[0], 'value': values[3]})
      hand1.append({'suit':suits[3], 'value': values[4]})

      expect(hand.check_three_of_a_kind(hand1)).to eql(0)
    end
  end
end
