class Deck

  def initialize(cards)
    @cards = cards
  end

  def shuffle_cards
    @cards.shuffle!()
  end

  def deal_cards(shuffled_cards)
    result = []
    players = ['1', '2', '3', '4']
    i = -1
    players.each do |player|
      cards = []
      i = i + 1
      card_index = i
      (0...5).each do |n|
        cards.append(shuffled_cards[card_index])
        card_index = card_index + 4
      end
      result.append({'player':player, 'hand': cards})
    end
    result
  end

end
