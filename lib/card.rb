class Card

  def make_values
    value = []
    (2...11).each do |n|
      value.append(n.to_s)
    end
    value.append('J')
    value.append('Q')
    value.append('K')
    value.append('A')
    return value
  end

  def make_suits
    cards = []
    values = make_values()
    suits = ["spade", "hearts", "club", "diamond"]
    suits.each do |suit|
      cards.append({'suit':suit, 'values':values})
    end
    return cards
  end

  def make_card_set
    simple_cards = []
    cards = make_suits()
    cards.each do |card|
      suit = card[:suit]
      values = card[:values]
      values.each do |value|
        simple_cards.append({'suit':suit, 'value':value})
      end
    end
    return simple_cards
  end
end
