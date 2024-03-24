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

  def get_pair_arrays(hand)
    hand_index_array = get_hand_index_array(hand)
    hand_pairs = hand_index_array.find_all{ |e| hand_index_array.count(e) > 1 }
    hand_pairs_unique = hand_pairs.group_by(&:itself).select{|_, a| a[1]}.keys

    return hand_pairs, hand_pairs_unique
  end

  def check_single_pair(hand)
    hand_pairs, hand_pairs_unique = get_pair_arrays(hand)
    element_count = hand_pairs.length()
    unique_element_count = hand_pairs_unique.length()

    if unique_element_count == 1 && element_count == 2
      result = 1
    else
      result = 0
    end
    return result
  end

  def check_double_pairs(hand)
    hand_pairs, hand_pairs_unique = get_pair_arrays(hand)
    element_count = hand_pairs.length()
    unique_element_count = hand_pairs_unique.length()

    if unique_element_count == 2 && element_count == 4
      result = 1
    else
      result = 0
    end
    return result
  end

  def check_three_of_a_kind(hand)
    hand_pairs, hand_pairs_unique = get_pair_arrays(hand)
    element_count = hand_pairs.length()
    unique_element_count = hand_pairs_unique.length()

    if unique_element_count == 1 && element_count == 3
      result = 1
    else
      result = 0
    end
    return result
  end

end
