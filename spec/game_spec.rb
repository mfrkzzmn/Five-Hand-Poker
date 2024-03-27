require 'game'
require 'deck'
require 'hand'
require 'player'


describe Game do
  before do
    @game_pot = 0
    @cards = []
    suits = ["spade", "hearts", "club", "diamond"]
    values = ['2', '3', '4', '5', '6', '7', '8', '9','10', 'J', 'Q', 'K','A']
    suits.each do |suit|
      values.each do |value|
        @cards.append({'suit':suit, 'value':value})
      end
    end

    @deck = Deck.new(@cards)

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

    @players = []

    player_pot = 100
    empty_hand = []
    empty_player_hand = Hand.new(empty_hand)
    @players.append(Player.new(empty_player_hand, player_pot))
    @players.append(Player.new(empty_player_hand, player_pot))
    @players.append(Player.new(empty_player_hand, player_pot))
    @players.append(Player.new(empty_player_hand, player_pot))

    @player1 = Player.new(empty_player_hand, player_pot)
    @player2 = Player.new(empty_player_hand, player_pot)

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

    @game = Game.new(@deck, @players)

  end

  describe "#start" do
    it "game started" do
      @game.start
      expect(@game.players[0]).not_to match_array(@players[0])
    end
  end

  describe "#compare hands" do
    it "check if first hand has high cards and second hand has same high cards" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

    it "check if first hand has high cards and second hand has low cards" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards11)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has low cards and second hand has high cards" do
      hand1 = Hand.new(@cards11)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has high cards and second hand has single pair" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has high cards and second hand has double pair" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has high cards and second hand has three of a kind" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has high cards and second hand has straight" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has high cards and second hand has a flush" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has high cards and second hand has a full house" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has high cards and second hand has a four of a kind" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has high cards and second hand has a straight flush" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has high cards and second hand has a royal flush" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    #first hand has single pair and second hand has other pattern start
    it "check if first hand has single pair and second hand has high cards" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has single pair and second hand has single pair" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

    it "check if first hand has single pair and second hand has double pair" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has single pair and second hand has three of a kind" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has single pair and second hand has straight" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has single pair and second hand has a flush" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has single pair and second hand has a full house" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has single pair and second hand has a four of a kind" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has single pair and second hand has a straight flush" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has single pair and second hand has a royal flush" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end
    #first hand has single pair and second hand has other patterns end

    #first hand has double pair and second hand has other patterns
    it "check if first hand has double pairs and second hand has high cards" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has double pairs and second hand has single pair" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has double pairs and second hand has double pairs" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

    it "check if first hand has double pair and second hand has three of a kind" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has double pair and second hand has straight" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has double pair and second hand has a flush" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has double pair and second hand has a full house" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has double pair and second hand has a four of a kind" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has double pair and second hand has a straight flush" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has double pair and second hand has a royal flush" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end
    #first hand has double pair and second hand has other patterns end

    #first hand has a three of a kind and second hand has other patterns
    it "check if first hand has a three of a kind and second hand has high cards" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a three of a kind and second hand has single pair" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a three of a kind and second hand has double pairs" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a three of a kind and second hand has three of a kind" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

    it "check if first hand has a three of a kind and second hand has straight" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a three of a kind and second hand has a flush" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a three of a kind and second hand has a full house" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a three of a kind and second hand has a four of a kind" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a three of a kind and second hand has a straight flush" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a three of a kind and second hand has a royal flush" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end
    #first hand has double pair and second hand has other patterns end

    #first hand has a straight and second hand has other patterns
    it "check if first hand has a straight and second hand has high cards" do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight and second hand has single pair" do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight and second hand has double pairs" do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight and second hand has three of a kind" do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight and second hand has a higher straight " do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

    it "check if first hand has a straight and second hand has a flush" do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a straight and second hand has a full house" do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a straight and second hand has a four of a kind" do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a straight and second hand has a straight flush" do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a straight and second hand has a royal flush" do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end
    #first hand has straight and second hand has other patterns end

    #first hand has a flush and second hand has other patterns
    it "check if first hand has a flush and second hand has high cards" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a flush and second hand has single pair" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a flush and second hand has double pairs" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a flush and second hand has three of a kind" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a flush and second hand has a straight " do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a flush and second hand has a flush" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

    it "check if first hand has a flush and second hand has a full house" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a flush and second hand has a four of a kind" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a flush and second hand has a straight flush" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a flush and second hand has a royal flush" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end
    #first hand has a flush and second hand has other patterns end

    #first hand has a full house and second hand has other patterns
    it "check if first hand has a full house and second hand has high cards" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a full house and second hand has single pair" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a full house and second hand has double pairs" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a full house and second hand has three of a kind" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a full house and second hand has a straight " do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a full house and second hand has a flush" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a full house and second hand has a full house" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

    it "check if first hand has a full house and second hand has a four of a kind" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a full house and second hand has a straight flush" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a full house and second hand has a royal flush" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end
    #first hand has a full house and second hand has other patterns end

    #first hand has a four of a kind and second hand has other patterns
    it "check if first hand has a four of a kind and second hand has high cards" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a four of a kind and second hand has single pair" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a four of a kind and second hand has double pairs" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a four of a kind and second hand has three of a kind" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a four of a kind and second hand has a straight " do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a four of a kind and second hand has a flush" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a four of a kind and second hand has a full house" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a four of a kind and second hand has a four of a kind" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

    it "check if first hand has a four of a kind and second hand has a straight flush" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a four of a kind and second hand has a royal flush" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end
    #first hand has a four of a kind and second hand has other patterns end

    #first hand has a straight flush and second hand has other patterns
    it "check if first hand has a straight flush and second hand has high cards" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight flush and second hand has single pair" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight flush and second hand has double pairs" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight flush and second hand has three of a kind" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight flush and second hand has a straight " do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight flush and second hand has a flush" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight flush and second hand has a full house" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight flush and second hand has a four of a kind" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight flush and second hand has a straight flush" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

    it "check if first hand has a straight flush and second hand has a royal flush" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end
    #first hand has a straight flush and second hand has other patterns end

    #first hand has a royal flush and second hand has other patterns
    it "check if first hand has a royal flush and second hand has high cards" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a royal flush and second hand has single pair" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a royal flush and second hand has double pairs" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a royal flush and second hand has three of a kind" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a royal flush and second hand has a straight " do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a royal flush and second hand has a flush" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a royal flush and second hand has a full house" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a royal flush and second hand has a four of a kind" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a royal flush and second hand has a straight flush" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a royal flush and second hand has a royal flush" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end
    #first hand has a straight flush and second hand has other patterns end

    #second hand has high hand and first hand has other patterns
    it "check if first hand has a high card and second hand has a higher high cards" do
      hand1 = Hand.new(@cards11)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a single pair and second hand has high card" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a double pair and second hand has higher cards" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a three of a kind and second hand has higher cards" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight and second hand has higher cards " do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a flush and second hand has higher cards" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a full house and second hand has higher cards" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a four of a kind and second hand has higher cards" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight flush and second hand has higher cards" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a royal flush and second hand has higher cards" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards1)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end
    #second hand has a higher and first hand has other patterns end

    #second hand has a single pair and first hand has other patterns
    it "check if first hand has a high card and second hand has a single pair" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a single pair and second hand has single pair" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

    it "check if first hand has a double pair and second hand has single pair" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a three of a kind and second hand has single pair" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight and second hand has single pair " do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a flush and second hand has single pair" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a full house and second hand has single pair" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a four of a kind and second hand has single pair" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight flush and second hand has single pair" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a royal flush and second hand has a single pair" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards2)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end
    #second hand has a single pair and first hand has other patterns end

    #second hand has a double pair and first hand has other patterns
    it "check if first hand has a high card and second hand has a double pair" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a single pair and second hand has double pair" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a double pair and second hand has double pair" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

    it "check if first hand has a three of a kind and second hand has double pair" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight and second hand has double pair " do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a flush and second hand has double pair" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a full house and second hand has double pair" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a four of a kind and second hand has double pair" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight flush and second hand has double pair" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a royal flush and second hand has a double pair" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards3)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end
    #second hand has a double pair and first hand has other patterns end

    #second hand has a three of a kind and first hand has other patterns
    it "check if first hand has a high card and second hand has a three of a kind" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a single pair and second hand has three of a kind" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a double pair and second hand has three of a kind" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a three of a kind and second hand has three of a kind" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

    it "check if first hand has a straight and second hand has three of a kind " do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a flush and second hand has three of a kind" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a full house and second hand has three of a kind" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a four of a kind and second hand has three of a kind" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight flush and second hand has three of a kind" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a royal flush and second hand has a three of a kind" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards4)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end
    #second hand has a three of a kind and first hand has other patterns end

    #second hand has a straight and first hand has other patterns
    it "check if first hand has a high card and second hand has a straight" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a single pair and second hand has straight" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a double pair and second hand has straight" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a three of a kind and second hand has straight" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a straight and second hand has straight " do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

    it "check if first hand has a flush and second hand has straight" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a full house and second hand has straight" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a four of a kind and second hand has straight" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight flush and second hand has straight" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a royal flush and second hand has a straight" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards5)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end
    #second hand has a straight and first hand has other patterns end

    #second hand has a flush and first hand has other patterns
    it "check if first hand has a high card and second hand has a flush" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a single pair and second hand has flush" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a double pair and second hand has flush" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a three of a kind and second hand has flush" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a straight and second hand has flush " do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a flush and second hand has flush" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

    it "check if first hand has a full house and second hand has flush" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a four of a kind and second hand has flush" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight flush and second hand has flush" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a royal flush and second hand has a flush" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards6)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end
    #second hand has a flush and first hand has other patterns end

    #second hand has a full house and first hand has other patterns
    it "check if first hand has a high card and second hand has a full house" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a single pair and second hand has full house" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a double pair and second hand has full house" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a three of a kind and second hand has full house" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a straight and second hand has full house " do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a flush and second hand has full house" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a full house and second hand has full house" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

    it "check if first hand has a four of a kind and second hand has full house" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a straight flush and second hand has full house" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a royal flush and second hand has a full house" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards7)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end
    #second hand has a full house and first hand has other patterns end

    #second hand has a four of a kind and first hand has other patterns
    it "check if first hand has a high card and second hand has a four of a kind" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a single pair and second hand has four of a kind" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a double pair and second hand has four of a kind" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a three of a kind and second hand has four of a kind" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a straight and second hand has four of a kind " do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a flush and second hand has four of a kind" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a full house and second hand has four of a kind" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a four of a kind and second hand has four of a kind" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

    it "check if first hand has a straight flush and second hand has four of a kind" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end

    it "check if first hand has a royal flush and second hand has a four of a kind" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards8)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end
    #second hand has a four of a kind and first hand has other patterns end

    #second hand has a straight flush and first hand has other patterns
    it "check if first hand has a high card and second hand has a straight flush" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a single pair and second hand has straight flush" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a double pair and second hand has straight flush" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a three of a kind and second hand has straight flush" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a straight and second hand has straight flush " do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a flush and second hand has straight flush" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a full house and second hand has straight flush" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a four of a kind and second hand has straight flush" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a straight flush and second hand has straight flush" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

    it "check if first hand has a royal flush and second hand has a straight flush" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards9)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(1)
    end
    #second hand has a straight flush and first hand has other patterns end

    #second hand has a royal flush and first hand has other patterns
    it "check if first hand has a high card and second hand has a royal flush" do
      hand1 = Hand.new(@cards1)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a single pair and second hand has royal flush" do
      hand1 = Hand.new(@cards2)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a double pair and second hand has royal flush" do
      hand1 = Hand.new(@cards3)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a three of a kind and second hand has royal flush" do
      hand1 = Hand.new(@cards4)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a straight and second hand has royal flush " do
      hand1 = Hand.new(@cards5)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a flush and second hand has royal flush" do
      hand1 = Hand.new(@cards6)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a full house and second hand has royal flush" do
      hand1 = Hand.new(@cards7)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a four of a kind and second hand has royal flush" do
      hand1 = Hand.new(@cards8)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a straight flush and second hand has royal flush" do
      hand1 = Hand.new(@cards9)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(-1)
    end

    it "check if first hand has a royal flush and second hand has a royal flush" do
      hand1 = Hand.new(@cards10)
      hand2 = Hand.new(@cards10)

      @player1.hand = hand1
      @player2.hand = hand2

      expect(@game.compare_hands(@player1, @player2)).to eql(0)
    end

  end

end
