require 'hand'


describe Hand do
  before do
    @cards1 = []
    @cards2 = []
    @cards3 = []
    @cards4 = []
    @cards5 = []
    @cards6 = []
    @cards7 = []
    @cards8 = []
    @cards9 = []
    @cards10 = []

    #high card hand
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['A', 'J', '9', '10', 'K']

    @cards1.append({'suit':suits1[0], 'value': values1[0]})
    @cards1.append({'suit':suits1[1], 'value': values1[1]})
    @cards1.append({'suit':suits1[2], 'value': values1[2]})
    @cards1.append({'suit':suits1[3], 'value': values1[3]})
    @cards1.append({'suit':suits1[0], 'value': values1[4]})

    #single pair hand
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['A', 'J', '2', '10', '2']

    @cards2.append({'suit':suits1[0], 'value': values1[0]})
    @cards2.append({'suit':suits1[1], 'value': values1[1]})
    @cards2.append({'suit':suits1[2], 'value': values1[2]})
    @cards2.append({'suit':suits1[0], 'value': values1[3]})
    @cards2.append({'suit':suits1[3], 'value': values1[4]})

    #double pair hand
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['A', '2', '2', '10', '10']

    @cards3.append({'suit':suits1[0], 'value': values1[0]})
    @cards3.append({'suit':suits1[0], 'value': values1[1]})
    @cards3.append({'suit':suits1[1], 'value': values1[2]})
    @cards3.append({'suit':suits1[2], 'value': values1[3]})
    @cards3.append({'suit':suits1[3], 'value': values1[4]})

    #three of a kind hand
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['A', 'J', '2', '2', '2']

    @cards4.append({'suit':suits1[0], 'value': values1[0]})
    @cards4.append({'suit':suits1[0], 'value': values1[1]})
    @cards4.append({'suit':suits1[1], 'value': values1[2]})
    @cards4.append({'suit':suits1[2], 'value': values1[3]})
    @cards4.append({'suit':suits1[3], 'value': values1[4]})

    #straight
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['4', '5', '7', '6', '8']

    @cards5.append({'suit':suits1[0], 'value': values1[0]})
    @cards5.append({'suit':suits1[1], 'value': values1[1]})
    @cards5.append({'suit':suits1[2], 'value': values1[2]})
    @cards5.append({'suit':suits1[3], 'value': values1[3]})
    @cards5.append({'suit':suits1[0], 'value': values1[4]})

    #flush
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['8', '7', '2', '6', '5']

    @cards6.append({'suit':suits1[0], 'value': values1[0]})
    @cards6.append({'suit':suits1[0], 'value': values1[1]})
    @cards6.append({'suit':suits1[0], 'value': values1[2]})
    @cards6.append({'suit':suits1[0], 'value': values1[3]})
    @cards6.append({'suit':suits1[0], 'value': values1[4]})

    #full house
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['K', 'K', '4', '4', '4']

    @cards7.append({'suit':suits1[0], 'value': values1[0]})
    @cards7.append({'suit':suits1[1], 'value': values1[1]})
    @cards7.append({'suit':suits1[0], 'value': values1[2]})
    @cards7.append({'suit':suits1[2], 'value': values1[3]})
    @cards7.append({'suit':suits1[2], 'value': values1[4]})

    #four of a kind
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['A', '4', '4', '4', '4']

    @cards8.append({'suit':suits1[0], 'value': values1[0]})
    @cards8.append({'suit':suits1[0], 'value': values1[1]})
    @cards8.append({'suit':suits1[1], 'value': values1[2]})
    @cards8.append({'suit':suits1[2], 'value': values1[3]})
    @cards8.append({'suit':suits1[3], 'value': values1[4]})

    #straight flush
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['8', '7', '5', '6', '4']

    @cards9.append({'suit':suits1[0], 'value': values1[0]})
    @cards9.append({'suit':suits1[0], 'value': values1[1]})
    @cards9.append({'suit':suits1[0], 'value': values1[2]})
    @cards9.append({'suit':suits1[0], 'value': values1[3]})
    @cards9.append({'suit':suits1[0], 'value': values1[4]})

    #royal flush
    suits2 = ["spade", "hearts", "club", "diamond"]
    values2 = ['A', 'K', 'Q', 'J', '10']

    @cards10.append({'suit':suits2[2], 'value': values2[0]})
    @cards10.append({'suit':suits2[2], 'value': values2[1]})
    @cards10.append({'suit':suits2[2], 'value': values2[2]})
    @cards10.append({'suit':suits2[2], 'value': values2[3]})
    @cards10.append({'suit':suits2[2], 'value': values2[4]})

  end

  describe "#get_hand_card_index" do
    it "get hand card index array" do
      hand = Hand.new(@cards2)
      hand1_index = [12, 9, 8, 0, 0]

      expect(hand.get_hand_card_index).to eq(hand1_index)
    end
  end

  # describe "#high_card" do
  #   it "first hand is greater" do
  #     hand = Hand.new(@cards1)
  #
  #     expect(hand.check_high_hand(hand1, hand2)).to eql(1)
  #   end
  #
  #   it "second hand is greater" do
  #     hand = Hand.new(@cards)
  #     hand1 = []
  #     hand2 = []
  #     suits = ["spade", "hearts", "club", "diamond"]
  #     values1 = ['A', 'J', '8', '6', '7']
  #     values2 = ['A', 'K', '4', '3', '2']
  #
  #     hand1.append({'suit':suits[1], 'value': values1[0]})
  #     hand1.append({'suit':suits[0], 'value': values1[1]})
  #     hand1.append({'suit':suits[2], 'value': values1[2]})
  #     hand1.append({'suit':suits[0], 'value': values1[3]})
  #     hand1.append({'suit':suits[3], 'value': values1[4]})
  #
  #     hand2.append({'suit':suits[0], 'value': values2[0]})
  #     hand2.append({'suit':suits[1], 'value': values2[1]})
  #     hand2.append({'suit':suits[0], 'value': values2[2]})
  #     hand2.append({'suit':suits[3], 'value': values2[3]})
  #     hand2.append({'suit':suits[2], 'value': values2[4]})
  #
  #     expect(hand.check_high_hand(hand1, hand2)).to eql(-1)
  #   end
  #
  #   it "both hands are equal" do
  #     hand = Hand.new(@cards)
  #     hand1 = []
  #     hand2 = []
  #     suits = ["spade", "hearts", "club", "diamond"]
  #     values1 = ['A', 'J', '8', '6', '7']
  #     values2 = ['A', 'J', '8', '6', '7']
  #
  #     hand1.append({'suit':suits[1], 'value': values1[0]})
  #     hand1.append({'suit':suits[0], 'value': values1[1]})
  #     hand1.append({'suit':suits[2], 'value': values1[2]})
  #     hand1.append({'suit':suits[0], 'value': values1[3]})
  #     hand1.append({'suit':suits[3], 'value': values1[4]})
  #
  #     hand2.append({'suit':suits[0], 'value': values2[0]})
  #     hand2.append({'suit':suits[1], 'value': values2[1]})
  #     hand2.append({'suit':suits[0], 'value': values2[2]})
  #     hand2.append({'suit':suits[3], 'value': values2[3]})
  #     hand2.append({'suit':suits[2], 'value': values2[4]})
  #
  #     expect(hand.check_high_hand(hand1, hand2)).to eql(0)
  #   end
  # end

  describe "#check_single_pair" do
    it "check if single pair exists by all different card values" do
      hand = Hand.new(@cards1)
      expect(hand.check_single_pair).to eql(0)
    end

    it "check if single pair exists by having single pair" do
      hand = Hand.new(@cards2)
      expect(hand.check_single_pair).to eql(1)
    end

    it "check if single pair exists by having double pair" do
      hand = Hand.new(@cards3)
      expect(hand.check_single_pair).to eql(0)
    end

    it "check if single pair exists by having three of a kind" do
      hand = Hand.new(@cards4)
      expect(hand.check_single_pair).to eql(0)
    end

    it "check if single pair exists by having straight" do
      hand = Hand.new(@cards5)
      expect(hand.check_single_pair).to eql(0)
    end

    it "check if single pair exists by having flush" do
      hand = Hand.new(@cards6)
      expect(hand.check_single_pair).to eql(0)
    end

    it "check if single pair exists by having full house" do
      hand = Hand.new(@cards7)
      expect(hand.check_single_pair).to eql(0)
    end

    it "check if single pair exists by having four of a kind" do
      hand = Hand.new(@cards8)
      expect(hand.check_single_pair).to eql(0)
    end

    it "check if single pair exists by having straight flush" do
      hand = Hand.new(@cards9)
      expect(hand.check_single_pair).to eql(0)
    end

    it "check if single pair exists by having royal flush" do
      hand = Hand.new(@cards10)
      expect(hand.check_single_pair).to eql(0)
    end
  end

  describe "#check_double_pair" do
    it "check if double pair exists by all different card values" do
      hand = Hand.new(@cards1)
      expect(hand.check_double_pair).to eql(0)
    end

    it "check if double pair exists by having single pair" do
      hand = Hand.new(@cards2)
      expect(hand.check_double_pair).to eql(0)
    end

    it "check if double pair exists by having double pairs" do
      hand = Hand.new(@cards3)
      expect(hand.check_double_pair).to eql(1)
    end

    it "check if double pair exists by having three of a kind" do
      hand = Hand.new(@cards4)
      expect(hand.check_double_pair).to eql(0)
    end

    it "check if double pair exists by having straight" do
      hand = Hand.new(@cards5)
      expect(hand.check_double_pair).to eql(0)
    end

    it "check if double pair exists by having flush" do
      hand = Hand.new(@cards6)
      expect(hand.check_double_pair).to eql(0)
    end

    it "check if double pair exists by having full house" do
      hand = Hand.new(@cards7)
      expect(hand.check_double_pair).to eql(0)
    end

    it "check if double pair exists by having four of a kind" do
      hand = Hand.new(@cards8)
      expect(hand.check_double_pair).to eql(0)
    end

    it "check if double pair exists by having straight flush" do
      hand = Hand.new(@cards9)
      expect(hand.check_double_pair).to eql(0)
    end

    it "check if double pair exists by having royal flush" do
      hand = Hand.new(@cards10)
      expect(hand.check_double_pair).to eql(0)
    end
  end

  describe "#check_three_of_a_kind" do
    it "check if three of a kind exists by all different card values" do
      hand = Hand.new(@cards1)
      expect(hand.check_three_of_a_kind).to eql(0)
    end

    it "check if three of a kind exists by having single pair" do
      hand = Hand.new(@cards2)
      expect(hand.check_three_of_a_kind).to eql(0)
    end

    it "check if three of a kind exists by having double pairs" do
      hand = Hand.new(@cards3)
      expect(hand.check_three_of_a_kind).to eql(0)
    end

    it "check if three of a kind exists by having three of a kind" do
      hand = Hand.new(@cards4)
      expect(hand.check_three_of_a_kind).to eql(1)
    end

    it "check if three of a kind exists by having straight" do
      hand = Hand.new(@cards5)
      expect(hand.check_three_of_a_kind).to eql(0)
    end

    it "check if three of a kind exists by having flush" do
      hand = Hand.new(@cards6)
      expect(hand.check_three_of_a_kind).to eql(0)
    end

    it "check if three of a kind exists by having full house" do
      hand = Hand.new(@cards7)
      expect(hand.check_three_of_a_kind).to eql(0)
    end

    it "check if three of a kind exists by having four of a kind" do
      hand = Hand.new(@cards8)
      expect(hand.check_three_of_a_kind).to eql(0)
    end

    it "check if three of a kind exists by having straight flush" do
      hand = Hand.new(@cards9)
      expect(hand.check_three_of_a_kind).to eql(0)
    end

    it "check if three of a kind exists by having royal flush" do
      hand = Hand.new(@cards10)
      expect(hand.check_three_of_a_kind).to eql(0)
    end
  end

  describe "#check_straight" do
    it "check if straight exists by all different card values" do
      hand = Hand.new(@cards1)
      expect(hand.check_straight).to eql(0)
    end

    it "check if straight exists by having single pair" do
      hand = Hand.new(@cards2)
      expect(hand.check_straight).to eql(0)
    end

    it "check if straight exists by having double pairs" do
      hand = Hand.new(@cards3)
      expect(hand.check_straight).to eql(0)
    end

    it "check if straight exists by having three of a kind" do
      hand = Hand.new(@cards4)
      expect(hand.check_straight).to eql(0)
    end

    it "check if straight exists by having straight" do
      hand = Hand.new(@cards5)
      expect(hand.check_straight).to eql(1)
    end

    it "check if straight exists by having flush" do
      hand = Hand.new(@cards6)
      expect(hand.check_straight).to eql(0)
    end

    it "check if straight exists by having full house" do
      hand = Hand.new(@cards7)
      expect(hand.check_straight).to eql(0)
    end

    it "check if straight exists by having four of a kind" do
      hand = Hand.new(@cards8)
      expect(hand.check_straight).to eql(0)
    end

    it "check if straight exists by having straight flush" do
      hand = Hand.new(@cards9)
      expect(hand.check_straight).to eql(0)
    end

    it "check if straight exists by having royal flush" do
      hand = Hand.new(@cards10)
      expect(hand.check_straight).to eql(0)
    end
  end

  describe "#check_flush" do
    it "check if flush exists by all different card values" do
      hand = Hand.new(@cards1)
      expect(hand.check_flush).to eql(0)
    end

    it "check if flush exists by having single pair" do
      hand = Hand.new(@cards2)
      expect(hand.check_flush).to eql(0)
    end

    it "check if flush exists by having double pairs" do
      hand = Hand.new(@cards3)
      expect(hand.check_flush).to eql(0)
    end

    it "check if flush exists by having three of a kind" do
      hand = Hand.new(@cards4)
      expect(hand.check_flush).to eql(0)
    end

    it "check if flush exists by having straight" do
      hand = Hand.new(@cards5)
      expect(hand.check_flush).to eql(0)
    end

    it "check if flush exists by having flush" do
      hand = Hand.new(@cards6)
      expect(hand.check_flush).to eql(1)
    end

    it "check if flush exists by having full house" do
      hand = Hand.new(@cards7)
      expect(hand.check_flush).to eql(0)
    end

    it "check if flush exists by having four of a kind" do
      hand = Hand.new(@cards8)
      expect(hand.check_flush).to eql(0)
    end

    it "check if flush exists by having straight flush" do
      hand = Hand.new(@cards9)
      expect(hand.check_flush).to eql(0)
    end

    it "check if flush exists by having royal flush" do
      hand = Hand.new(@cards10)
      expect(hand.check_flush).to eql(0)
    end
  end

  describe "#check_full_house" do
    it "check if full house exists by all different card values" do
      hand = Hand.new(@cards1)
      expect(hand.check_full_house).to eql(0)
    end

    it "check if full house exists by having single pair" do
      hand = Hand.new(@cards2)
      expect(hand.check_full_house).to eql(0)
    end

    it "check if full house exists by having double pairs" do
      hand = Hand.new(@cards3)
      expect(hand.check_full_house).to eql(0)
    end

    it "check if full house exists by having three of a kind" do
      hand = Hand.new(@cards4)
      expect(hand.check_full_house).to eql(0)
    end

    it "check if full house exists by having straight" do
      hand = Hand.new(@cards5)
      expect(hand.check_full_house).to eql(0)
    end

    it "check if full house exists by having flush" do
      hand = Hand.new(@cards6)
      expect(hand.check_full_house).to eql(0)
    end

    it "check if full house exists by having full house" do
      hand = Hand.new(@cards7)
      expect(hand.check_full_house).to eql(1)
    end

    it "check if full house exists by having four of a kind" do
      hand = Hand.new(@cards8)
      expect(hand.check_full_house).to eql(0)
    end

    it "check if full house exists by having straight flush" do
      hand = Hand.new(@cards9)
      expect(hand.check_full_house).to eql(0)
    end

    it "check if full house exists by having royal flush" do
      hand = Hand.new(@cards10)
      expect(hand.check_full_house).to eql(0)
    end
  end

  describe "#check_four_of_a_kind" do
    it "check if four of a kind exists by all different card values" do
      hand = Hand.new(@cards1)
      expect(hand.check_four_of_a_kind).to eql(0)
    end

    it "check if four of a kind exists by having single pair" do
      hand = Hand.new(@cards2)
      expect(hand.check_four_of_a_kind).to eql(0)
    end

    it "check if four of a kind exists by having double pairs" do
      hand = Hand.new(@cards3)
      expect(hand.check_four_of_a_kind).to eql(0)
    end

    it "check if four of a kind exists by having three of a kind" do
      hand = Hand.new(@cards4)
      expect(hand.check_four_of_a_kind).to eql(0)
    end

    it "check if four of a kind exists by having straight" do
      hand = Hand.new(@cards5)
      expect(hand.check_four_of_a_kind).to eql(0)
    end

    it "check if four of a kind exists by having flush" do
      hand = Hand.new(@cards6)
      expect(hand.check_four_of_a_kind).to eql(0)
    end

    it "check if four of a kind exists by having full house" do
      hand = Hand.new(@cards7)
      expect(hand.check_four_of_a_kind).to eql(0)
    end

    it "check if four of a kind exists by having four of a kind" do
      hand = Hand.new(@cards8)
      expect(hand.check_four_of_a_kind).to eql(1)
    end

    it "check if four of a kind exists by having straight flush" do
      hand = Hand.new(@cards9)
      expect(hand.check_four_of_a_kind).to eql(0)
    end

    it "check if four of a kind exists by having royal flush" do
      hand = Hand.new(@cards10)
      expect(hand.check_four_of_a_kind).to eql(0)
    end
  end

  describe "#check_straight_flush" do
    it "check if straight flush exists by all different card values" do
      hand = Hand.new(@cards1)
      expect(hand.check_straight_flush).to eql(0)
    end

    it "check if straight flush exists by having single pair" do
      hand = Hand.new(@cards2)
      expect(hand.check_straight_flush).to eql(0)
    end

    it "check if straight flush exists by having double pairs" do
      hand = Hand.new(@cards3)
      expect(hand.check_straight_flush).to eql(0)
    end

    it "check if straight flush exists by having three of a kind" do
      hand = Hand.new(@cards4)
      expect(hand.check_straight_flush).to eql(0)
    end

    it "check if straight flush exists by having straight" do
      hand = Hand.new(@cards5)
      expect(hand.check_straight_flush).to eql(0)
    end

    it "check if straight flush exists by having flush" do
      hand = Hand.new(@cards6)
      expect(hand.check_straight_flush).to eql(0)
    end

    it "check if straight flush exists by having full house" do
      hand = Hand.new(@cards7)
      expect(hand.check_straight_flush).to eql(0)
    end

    it "check if straight flush exists by having four of a kind" do
      hand = Hand.new(@cards8)
      expect(hand.check_straight_flush).to eql(0)
    end

    it "check if straight flush exists by having straight flush" do
      hand = Hand.new(@cards9)
      expect(hand.check_straight_flush).to eql(1)
    end

    it "check if straight flush exists by having royal flush" do
      hand = Hand.new(@cards10)
      expect(hand.check_straight_flush).to eql(0)
    end
  end

  describe "#check_royal_flush" do
    it "check if royal flush exists by all different card values" do
      hand = Hand.new(@cards1)
      expect(hand.check_royal_flush).to eql(0)
    end

    it "check if royal flush exists by having single pair" do
      hand = Hand.new(@cards2)
      expect(hand.check_royal_flush).to eql(0)
    end

    it "check if royal flush exists by having double pairs" do
      hand = Hand.new(@cards3)
      expect(hand.check_royal_flush).to eql(0)
    end

    it "check if royal flush exists by having three of a kind" do
      hand = Hand.new(@cards4)
      expect(hand.check_royal_flush).to eql(0)
    end

    it "check if royal flush exists by having straight" do
      hand = Hand.new(@cards5)
      expect(hand.check_royal_flush).to eql(0)
    end

    it "check if royal flush exists by having flush" do
      hand = Hand.new(@cards6)
      expect(hand.check_royal_flush).to eql(0)
    end

    it "check if royal flush exists by having full house" do
      hand = Hand.new(@cards7)
      expect(hand.check_royal_flush).to eql(0)
    end

    it "check if royal flush exists by having four of a kind" do
      hand = Hand.new(@cards8)
      expect(hand.check_royal_flush).to eql(0)
    end

    it "check if royal flush exists by having straight flush" do
      hand = Hand.new(@cards9)
      expect(hand.check_royal_flush).to eql(0)
    end

    it "check if royal flush exists by having royal flush" do
      hand = Hand.new(@cards10)
      expect(hand.check_royal_flush).to eql(1)
    end
  end

end
