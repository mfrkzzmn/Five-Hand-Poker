class Game
  attr_accessor :deck
  attr_accessor :cards
  attr_accessor :players
  attr_accessor :game_pot

  def initialize(deck, new_players)
    @game_pot = 0
    @deck = deck
    @players = new_players
  end

  def start
    @card = @deck.shuffle_cards
    players_cards = @deck.deal_cards(@card)
    (0...3).each do |n|
      @players[n].hand = players_cards[n][:hand]
    end
  end

end
