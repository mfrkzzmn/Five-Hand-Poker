class Deck

  def initialize(cards)
    @cards = cards
  end

  def get_cards
    return @cards
  end

  def shuffle_cards
    @cards.shuffle!()
    return @cards
  end

  def deal_cards(shuffled_cards)
    result = []
    players = ['1', '2', '3', '4']
    # puts shuffled_cards
    i = -1
    players.each do |player|
      cards = []
      i = i + 1
      card_index = i
      (1...6).each do |n|
        cards.append(shuffled_cards[card_index])
        card_index = card_index + 4
      end
      result.append({'player':player, 'cards': cards})
    end
    puts result
    return result
  end

end
