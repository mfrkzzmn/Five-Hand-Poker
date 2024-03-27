require 'player'


describe Player do
  before do
    @pot = 100
    @cards = []
    suits = ["spade", "hearts", "club", "diamond"]
    values = ['2', '3', '4', '5', '6', '7', '8', '9','10', 'J', 'Q', 'K','A']
    suits.each do |suit|
      values.each do |value|
        @cards.append({'suit':suit, 'value':value})
      end
    end

    @hands = []
    hand1 = []
    hand2 = []
    hand3 = []
    hand4 = []
    hand5 = []
    hand6 = []
    hand7 = []
    hand8 = []
    hand9 = []
    hand10 = []

    #high card hand
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['A', 'J', '9', '10', 'K']

    hand1.append({'suit':suits1[0], 'value': values1[0]})
    hand1.append({'suit':suits1[1], 'value': values1[1]})
    hand1.append({'suit':suits1[2], 'value': values1[2]})
    hand1.append({'suit':suits1[3], 'value': values1[3]})
    hand1.append({'suit':suits1[0], 'value': values1[4]})
    @hands.append(hand1)

    #single pair hand
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['A', 'J', '2', '10', '2']

    hand2.append({'suit':suits1[0], 'value': values1[0]})
    hand2.append({'suit':suits1[1], 'value': values1[1]})
    hand2.append({'suit':suits1[2], 'value': values1[2]})
    hand2.append({'suit':suits1[0], 'value': values1[3]})
    hand2.append({'suit':suits1[3], 'value': values1[4]})
    @hands.append(hand2)

    #double pair hand
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['A', '2', '2', '10', '10']

    hand3.append({'suit':suits1[0], 'value': values1[0]})
    hand3.append({'suit':suits1[0], 'value': values1[1]})
    hand3.append({'suit':suits1[1], 'value': values1[2]})
    hand3.append({'suit':suits1[2], 'value': values1[3]})
    hand3.append({'suit':suits1[3], 'value': values1[4]})
    @hands.append(hand3)

    #three of a kind hand
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['A', 'J', '2', '2', '2']

    hand4.append({'suit':suits1[0], 'value': values1[0]})
    hand4.append({'suit':suits1[0], 'value': values1[1]})
    hand4.append({'suit':suits1[1], 'value': values1[2]})
    hand4.append({'suit':suits1[2], 'value': values1[3]})
    hand4.append({'suit':suits1[3], 'value': values1[4]})
    @hands.append(hand4)

    #straight
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['4', '5', '7', '6', '8']

    hand5.append({'suit':suits1[0], 'value': values1[0]})
    hand5.append({'suit':suits1[1], 'value': values1[1]})
    hand5.append({'suit':suits1[2], 'value': values1[2]})
    hand5.append({'suit':suits1[3], 'value': values1[3]})
    hand5.append({'suit':suits1[0], 'value': values1[4]})
    @hands.append(hand5)

    #flush
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['8', '7', '2', '6', '5']

    hand6.append({'suit':suits1[0], 'value': values1[0]})
    hand6.append({'suit':suits1[0], 'value': values1[1]})
    hand6.append({'suit':suits1[0], 'value': values1[2]})
    hand6.append({'suit':suits1[0], 'value': values1[3]})
    hand6.append({'suit':suits1[0], 'value': values1[4]})
    @hands.append(hand6)

    #full house
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['K', 'K', '4', '4', '4']

    hand7.append({'suit':suits1[0], 'value': values1[0]})
    hand7.append({'suit':suits1[1], 'value': values1[1]})
    hand7.append({'suit':suits1[0], 'value': values1[2]})
    hand7.append({'suit':suits1[2], 'value': values1[3]})
    hand7.append({'suit':suits1[2], 'value': values1[4]})
    @hands.append(hand7)

    #four of a kind
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['A', '4', '4', '4', '4']

    hand8.append({'suit':suits1[0], 'value': values1[0]})
    hand8.append({'suit':suits1[0], 'value': values1[1]})
    hand8.append({'suit':suits1[1], 'value': values1[2]})
    hand8.append({'suit':suits1[2], 'value': values1[3]})
    hand8.append({'suit':suits1[3], 'value': values1[4]})
    @hands.append(hand8)

    #straight flush
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['8', '7', '5', '6', '4']

    hand9.append({'suit':suits1[0], 'value': values1[0]})
    hand9.append({'suit':suits1[0], 'value': values1[1]})
    hand9.append({'suit':suits1[0], 'value': values1[2]})
    hand9.append({'suit':suits1[0], 'value': values1[3]})
    hand9.append({'suit':suits1[0], 'value': values1[4]})
    @hands.append(hand9)

    #royal flush
    suits2 = ["spade", "hearts", "club", "diamond"]
    values2 = ['A', 'K', 'Q', 'J', '10']

    hand10.append({'suit':suits2[2], 'value': values2[0]})
    hand10.append({'suit':suits2[2], 'value': values2[1]})
    hand10.append({'suit':suits2[2], 'value': values2[2]})
    hand10.append({'suit':suits2[2], 'value': values2[3]})
    hand10.append({'suit':suits2[2], 'value': values2[4]})
    @hands.append(hand10)

  end

  describe "#fold" do
    it "player folds" do
      hand = @hands[8]
      player = Player.new(hand, @pot)
      status = 0

      expect(player.fold).to eql(status)
    end
  end

  describe "#check" do
    it "player decides to check the current pot" do
      hand = @hands[8]
      player = Player.new(hand, @pot)
      status = 1

      expect(player.pot_check).to eql(status)
    end
  end

  describe "#pot_call" do
    it "player decides to call the current increased bet when he has the money" do
      hand = @hands[8]
      player = Player.new(hand, @pot)
      call_amount = 10
      result = 10
      amount = player.pot_call(call_amount)
      expect(amount).to eql(result)
    end

    it "player decides to call the current increased bet when he has the money and check whether his status changes" do
      hand = @hands[8]
      player = Player.new(hand, @pot)
      call_amount = 10
      status = 2
      player.pot_call(call_amount)
      expect(player.status).to eql(status)
    end

    it "player decides to call the current increased bet when he has the money and check his current pot" do
      hand = @hands[8]
      player = Player.new(hand, @pot)
      call_amount = 10
      pot_amount = 90
      player.pot_call(call_amount)
      expect(player.pot).to eql(pot_amount)
    end

    it "player decides to call the current increased bet when he has not the money" do
      hand = @hands[8]
      player = Player.new(hand, @pot)
      call_amount = 110
      result = -1
      amount = player.pot_call(call_amount)
      expect(amount).to eql(result)
    end

    it "player decides to call the current increased bet when he has not the money and check whether his status changes" do
      hand = @hands[8]
      player = Player.new(hand, @pot)
      call_amount = 110
      status = -1
      player.pot_call(call_amount)
      expect(player.status).to eql(status)
    end

    it "player decides to call the current increased bet when he has the money and check his current pot" do
      hand = @hands[8]
      player = Player.new(hand, @pot)
      call_amount = 110
      pot_amount = 100
      player.pot_call(call_amount)
      expect(player.pot).to eql(pot_amount)
    end
  end

  describe "#pot_raise" do
    it "player decides to raise the game pot when he has the money" do
      hand = @hands[8]
      player = Player.new(hand, @pot)
      call_amount = 10
      result = 10
      amount = player.pot_raise(call_amount)
      expect(amount).to eql(result)
    end

    it "player decides to raise the game pot when he has the money and check whether his status changes" do
      hand = @hands[8]
      player = Player.new(hand, @pot)
      call_amount = 10
      status = 3
      player.pot_raise(call_amount)
      expect(player.status).to eql(status)
    end

    it "player decides to raise the game pot when he has the money and check his current pot" do
      hand = @hands[8]
      player = Player.new(hand, @pot)
      call_amount = 10
      pot_amount = 90
      player.pot_raise(call_amount)
      expect(player.pot).to eql(pot_amount)
    end

    it "player decides to raise the game pot when he has not the money" do
      hand = @hands[8]
      player = Player.new(hand, @pot)
      call_amount = 110
      result = -1
      amount = player.pot_raise(call_amount)
      expect(amount).to eql(result)
    end

    it "player decides to raise the game pot when he has not the money and check whether his status changes" do
      hand = @hands[8]
      player = Player.new(hand, @pot)
      call_amount = 110
      status = -1
      player.pot_raise(call_amount)
      expect(player.status).to eql(status)
    end

    it "player decides to raise the game pot when he has the money and check his current pot" do
      hand = @hands[8]
      player = Player.new(hand, @pot)
      call_amount = 110
      pot_amount = 100
      player.pot_raise(call_amount)
      expect(player.pot).to eql(pot_amount)
    end
  end

  describe "#card_replace" do
    it "player replaces 1 card and check the new top index of the cards in the deck" do
      hand = @hands[2]
      player = Player.new(hand, @pot)
      top_index = 20
      hand_card_index = [0]
      new_top_index = 21

      expect(player.card_replace(@cards, top_index, hand_card_index)).to eql(new_top_index)
    end

    it "player replaces 1 card and check the replaced card" do
      hand = @hands[2]
      player = Player.new(hand, @pot)
      top_index = 20
      hand_card_index = [0]
      player.card_replace(@cards, top_index, hand_card_index)
      card = @cards[top_index]
      hand_card = player.hand[4]

      expect(hand_card).to eql(card)
    end

    it "player replaces 2 cards and check the new top index of the cards in the deck" do
      hand = @hands[1]
      player = Player.new(hand, @pot)
      top_index = 20
      hand_card_index = [1, 3]
      new_top_index = 22

      expect(player.card_replace(@cards, top_index, hand_card_index)).to eql(new_top_index)
    end

    it "player replaces 2 cards and check one replaced card" do
      hand = @hands[1]
      player = Player.new(hand, @pot)
      top_index = 20
      hand_card_index = [1, 3]
      player.card_replace(@cards, top_index, hand_card_index)
      card = @cards[top_index]
      hand_card = player.hand[3]

      expect(hand_card).to eql(card)
    end

    it "player replaces 3 cards and check the new top index of the cards in the deck" do
      hand = @hands[1]
      player = Player.new(hand, @pot)
      top_index = 20
      hand_card_index = [0, 1, 3]
      new_top_index = 23

      expect(player.card_replace(@cards, top_index, hand_card_index)).to eql(new_top_index)
    end

    it "player replaces 3 cards and check one replaced card" do
      hand = @hands[1]
      player = Player.new(hand, @pot)
      top_index = 20
      hand_card_index = [0, 1, 3]
      player.card_replace(@cards, top_index, hand_card_index)
      card = @cards[top_index]
      hand_card = player.hand[2]

      expect(hand_card).to eql(card)
    end
  end
end
