class Hand

  def initialize(cards)
    @cards = cards
  end

  def get_hand_index_array(hand)
    values = ['2', '3', '4', '5', '6', '7', '8', '9','10', 'J', 'Q', 'K','A']
    hand_index = []

    hand.each do |h|
      index = values.find_index(h[:value])
      hand_index.append(index)
    end
    hand_index.sort!{|a,b| b<=>a}

    return hand_index
  end

  def check_high_hand(hand1, hand2)
    hand1_index = get_hand_index_array(hand1)
    hand2_index = get_hand_index_array(hand2)
    result = hand1_index <=> hand2_index
    return result
  end

end
