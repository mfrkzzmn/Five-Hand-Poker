require 'game'
require 'deck'
require 'player'


describe Game do
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

    @deck = Deck.new(@cards)

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

    @players = []

    player_pot = 100
    @players.append(Player.new(hand5, player_pot))
    @players.append(Player.new(hand6, player_pot))
    @players.append(Player.new(hand7, player_pot))
    @players.append(Player.new(hand2, player_pot))

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

  describe "#start" do
    it "game started" do
      game = Game.new(@deck, @players)
      expect(game.start).to match_array(game.players)
    end
  end
end
