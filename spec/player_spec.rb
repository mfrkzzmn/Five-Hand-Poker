require 'player'
require 'hand'


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
    @cards11 = []

    #high card hand
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['A', 'J', '9', '10', 'K']

    @cards1.append({'suit':suits1[0], 'value': values1[0]})
    @cards1.append({'suit':suits1[1], 'value': values1[1]})
    @cards1.append({'suit':suits1[2], 'value': values1[2]})
    @cards1.append({'suit':suits1[3], 'value': values1[3]})
    @cards1.append({'suit':suits1[0], 'value': values1[4]})

    #high card hand lower
    suits1 = ["spade", "hearts", "club", "diamond"]
    values1 = ['2', '4', '6', '7', '10']

    @cards11.append({'suit':suits1[0], 'value': values1[0]})
    @cards11.append({'suit':suits1[1], 'value': values1[1]})
    @cards11.append({'suit':suits1[2], 'value': values1[2]})
    @cards11.append({'suit':suits1[3], 'value': values1[3]})
    @cards11.append({'suit':suits1[0], 'value': values1[4]})

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

    @hand1 = Hand.new(@cards1)
    @hand2 = Hand.new(@cards2)

  end

  describe "#fold" do
    it "player folds" do
      player = Player.new(@hand1, @pot)
      status = 0

      expect(player.fold).to eql(status)
    end
  end

  describe "#check" do
    it "player decides to check the current pot" do
      player = Player.new(@hand1, @pot)
      status = 1

      expect(player.pot_check).to eql(status)
    end
  end

  describe "#pot_call" do
    it "player decides to call the current increased bet when he has the money" do
      player = Player.new(@hand1, @pot)
      call_amount = 10
      result = 10
      amount = player.pot_call(call_amount)
      expect(amount).to eql(result)
    end

    it "player decides to call the current increased bet when he has the money and check whether his status changes" do
      player = Player.new(@hand1, @pot)
      call_amount = 10
      status = 2
      player.pot_call(call_amount)
      expect(player.status).to eql(status)
    end

    it "player decides to call the current increased bet when he has the money and check his current pot" do
      player = Player.new(@hand1, @pot)
      call_amount = 10
      pot_amount = 90
      player.pot_call(call_amount)
      expect(player.pot).to eql(pot_amount)
    end

    it "player decides to call the current increased bet when he has not the money" do
      player = Player.new(@hand1, @pot)
      call_amount = 110
      result = -1
      amount = player.pot_call(call_amount)
      expect(amount).to eql(result)
    end

    it "player decides to call the current increased bet when he has not the money and check whether his status changes" do
      player = Player.new(@hand1, @pot)
      call_amount = 110
      status = -1
      player.pot_call(call_amount)
      expect(player.status).to eql(status)
    end

    it "player decides to call the current increased bet when he has the money and check his current pot" do
      player = Player.new(@hand1, @pot)
      call_amount = 110
      pot_amount = 100
      player.pot_call(call_amount)
      expect(player.pot).to eql(pot_amount)
    end
  end

  describe "#pot_raise" do
    it "player decides to raise the game pot when he has the money" do
      player = Player.new(@hand1, @pot)
      call_amount = 10
      result = 10
      amount = player.pot_raise(call_amount)
      expect(amount).to eql(result)
    end

    it "player decides to raise the game pot when he has the money and check whether his status changes" do
      player = Player.new(@hand1, @pot)
      call_amount = 10
      status = 3
      player.pot_raise(call_amount)
      expect(player.status).to eql(status)
    end

    it "player decides to raise the game pot when he has the money and check his current pot" do
      player = Player.new(@hand1, @pot)
      call_amount = 10
      pot_amount = 90
      player.pot_raise(call_amount)
      expect(player.pot).to eql(pot_amount)
    end

    it "player decides to raise the game pot when he has not the money" do
      player = Player.new(@hand1, @pot)
      call_amount = 110
      result = -1
      amount = player.pot_raise(call_amount)
      expect(amount).to eql(result)
    end

    it "player decides to raise the game pot when he has not the money and check whether his status changes" do
      player = Player.new(@hand1, @pot)
      call_amount = 110
      status = -1
      player.pot_raise(call_amount)
      expect(player.status).to eql(status)
    end

    it "player decides to raise the game pot when he has the money and check his current pot" do
      player = Player.new(@hand1, @pot)
      call_amount = 110
      pot_amount = 100
      player.pot_raise(call_amount)
      expect(player.pot).to eql(pot_amount)
    end
  end

  describe "#card_replace" do
    it "player replaces 1 card and check the new top index of the cards in the deck" do
      player = Player.new(@hand2, @pot)
      top_index = 20
      hand_card_index = [0]
      new_top_index = 21

      expect(player.card_replace(@cards, top_index, hand_card_index)).to eql(new_top_index)
    end

    it "player replaces 1 card and check the replaced card" do
      player = Player.new(@hand2, @pot)
      top_index = 20
      hand_card_index = [0]
      player.card_replace(@cards, top_index, hand_card_index)
      card = @cards[top_index]
      hand_card = player.hand.cards[4]

      expect(hand_card).to eql(card)
    end

    it "player replaces 2 cards and check the new top index of the cards in the deck" do
      player = Player.new(@hand1, @pot)
      top_index = 20
      hand_card_index = [1, 3]
      new_top_index = 22

      expect(player.card_replace(@cards, top_index, hand_card_index)).to eql(new_top_index)
    end

    it "player replaces 2 cards and check one replaced card" do
      player = Player.new(@hand1, @pot)
      top_index = 20
      hand_card_index = [1, 3]
      player.card_replace(@cards, top_index, hand_card_index)
      card = @cards[top_index]
      hand_card = player.hand.cards[3]

      expect(hand_card).to eql(card)
    end

    it "player replaces 3 cards and check the new top index of the cards in the deck" do
      player = Player.new(@hand1, @pot)
      top_index = 20
      hand_card_index = [0, 1, 3]
      new_top_index = 23

      expect(player.card_replace(@cards, top_index, hand_card_index)).to eql(new_top_index)
    end

    it "player replaces 3 cards and check one replaced card" do
      player = Player.new(@hand1, @pot)
      top_index = 20
      hand_card_index = [0, 1, 3]
      player.card_replace(@cards, top_index, hand_card_index)
      card = @cards[top_index]
      hand_card = player.hand.cards[2]

      expect(hand_card).to eql(card)
    end
  end
end
