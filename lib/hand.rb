class Hand

  def initialize(cards)
    @cards = cards
  end

  def get_hand_index_array(hand1, hand2)
    values = ['2', '3', '4', '5', '6', '7', '8', '9','10', 'J', 'Q', 'K','A']
    hand1_index = []
    hand2_index = []

    hand1.each do |hand|
      index = values.find_index(hand[:value])
      hand1_index.append(index)
    end
    hand1_index.sort!{|a,b| b<=>a}

    hand2.each do |hand|
      index = values.find_index(hand[:value])
      hand2_index.append(index)
    end
    hand2_index.sort!{|a,b| b<=>a}

    return hand1_index, hand2_index
  end

  def check_high_hand(hand1, hand2)
    hand1_index, hand2_index = get_hand_index_array(hand1, hand2)
    result = hand1_index <=> hand2_index
    return result
  end

end
