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

  def check_four_of_a_kind(hand)
    hand_pairs, hand_pairs_unique = get_pair_arrays(hand)
    element_count = hand_pairs.length()
    unique_element_count = hand_pairs_unique.length()

    if unique_element_count == 1 && element_count == 4
      result = 1
    else
      result = 0
    end
    return result
  end

  def check_pre_straight(hand)
    hand_index_array = get_hand_index_array(hand)
    hand_suits = hand.map { |p| p[:suit] }.uniq
    straight_value = 1

    (0...4).each do |n|
      first_index = hand_index_array[n]
      second_index = hand_index_array[n+1]
      second_index = Integer(second_index) + 1

      if n == 0
        if first_index != second_index
          if first_index == 12 && second_index == 4
            straight_value = 1
          else
            straight_value = 0
          end
        end
      else
        if first_index != second_index
          straight_value = 0
        end
      end
    end
    return straight_value, hand_suits, hand_index_array
  end

  def check_straight(hand)
    straight = 0
    straight_value, hand_suits, hand_index_array = check_pre_straight(hand)

    if straight_value == 1 && hand_suits.length() > 1
      straight = 1
    end

    return straight
  end

  def check_straight_flush(hand)
    straight_first_condition = 0
    straight_second_condition = 1
    straight = 0
    straight_value, hand_suits, hand_index_array = check_pre_straight(hand)

    if straight_value == 1 && hand_suits.length() == 1
      straight_first_condition = 1
    end

    if hand_index_array[0] == 12 && hand_index_array[1] == 11
      straight_second_condition = 0
    end

    if straight_first_condition == 1 && straight_second_condition == 1
      straight = 1
    end

    return straight
  end

  def check_royal_flush(hand)
    straight_first_condition = 0
    straight_second_condition = 0
    straight = 0
    straight_value, hand_suits, hand_index_array = check_pre_straight(hand)

    if straight_value == 1 && hand_suits.length() == 1
      straight_first_condition = 1
    end

    if hand_index_array[0] == 12 && hand_index_array[1] == 11
      straight_second_condition = 1
    end

    if straight_first_condition == 1 && straight_second_condition == 1
      straight = 1
    end

    return straight
  end

  def check_flush(hand)
    flush = 0
    hand_suits = hand.map { |p| p[:suit] }.uniq

    if hand_suits.length() == 1
      flush = 1
    end

    return flush
  end

end
