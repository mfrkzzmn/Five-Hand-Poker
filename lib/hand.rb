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

  def check_full_house(hand)
    hand_pairs, hand_pairs_unique = get_pair_arrays(hand)
    full_house = 0

    if hand_pairs_unique.length() != 2
      return full_house
    end

    hand_card_occurance = hand_pairs.group_by{|e| e}.map{|k, v| [k, v.length]}.to_h
    hand_card_occurance = hand_card_occurance.sort_by {|_key, value| value}.to_h

    card_occurance =  hand_card_occurance.values
    if card_occurance[0] == 2 && card_occurance[1] == 3
      full_house = 1
    end

    return full_house
  end

  def check_same_hand(hand1_card_index, hand2_card_index)
    result = -2
    (0...5).each do |n|
      if hand1_card_index[n] < hand2_card_index[n]
        result = -1
        break
      elsif hand1_card_index[n] > hand2_card_index[n]
        result = 1
        break
      else
        if n == 4
          result = 0
        end
      end
    end

    return result
  end

  def get_hand_pattern(hand)
    #result can be 1, 0, -1. if 1, then hand1 wins. if 0, then it is a tie. if -1, then hand2 wins
    continue_hand = 1
    hand_value = [0, 0, 0, 0 , 0, 0 , 0, 0, 0, 0]

    hand_straight_flush = 0
    hand_four_of_a_kind = 0
    hand_full_house = 0
    hand_flush = 0
    hand_straight = 0
    hand_three_of_a_kind = 0
    hand_double_pair = 0
    hand_single_pair = 0
    hand_royal_flush = check_royal_flush(hand)

    # check if hand got royal flush
    if hand_royal_flush == 1
      continue_hand = 0
      hand_value[9] = 1
    end

    # check if hand checking continues or not, straight flush
    if continue_hand == 1
      hand_straight_flush = check_straight_flush(hand)
    end

    if hand_straight_flush == 1
      continue_hand = 0
      hand_value[8] = 1
    end

    # check if hand checking continues or not, four of a kinds.
    if continue_hand == 1
      hand_four_of_a_kind = check_four_of_a_kind(hand)
    end

    if hand_four_of_a_kind == 1
      continue_hand = 0
      hand_value[7] = 1
    end

    # check if hand checking continues or not, full house.
    if continue_hand == 1
      hand_full_house = check_full_house(hand)
    end

    if hand_full_house == 1
      continue_hand = 0
      hand_value[6] = 1
    end

    # check if hand checking continues or not, flush.
    if continue_hand == 1
      hand_flush = check_flush(hand)
    end

    if hand_flush == 1
      continue_hand = 0
      hand_value[5] = 1
    end

    # check if hand checking continues or not, straight.
    if continue_hand == 1
      hand_straight = check_straight(hand)
    end

    if hand_straight == 1
      continue_hand = 0
      hand_value[4] = 1
    end

    # check if hand checking continues or not, three of a kinds.
    if continue_hand == 1
      hand_three_of_a_kind = check_three_of_a_kind(hand)
    end

    if hand_three_of_a_kind == 1
      continue_hand = 0
      hand_value[3] = 1
    end

     # check if hand checking continues or not, double pairs.
    if continue_hand == 1
      hand_double_pair = check_double_pairs(hand)
    end

    if hand_double_pair == 1
      continue_hand = 0
      hand_value[2] = 1
    end

    # check if hand checking continues or not, single pair.
    if continue_hand == 1
      hand_single_pair = check_single_pair(hand)
    end

    if hand_single_pair == 1
      continue_hand = 0
      hand_value[1] = 1
    end

    # if hand1 contunues, then it is high cards
    if continue_hand == 1
      hand_value[0] = 1
    end

    return hand_value
  end

  def compare_hands(hand1, hand2)
    #result can be 1, 0, -1. if 1, then hand1 wins. if 0, then it is a tie. if -1, then hand2 wins
    result = -2
    hand1_value = get_hand_pattern(hand1)
    hand2_value = get_hand_pattern(hand2)

    is_hand1_high_card = hand1_value[0]
    is_hand2_high_card = hand2_value[0]

    if is_hand1_high_card == 0 && is_hand2_high_card == 0
      index1 = hand1_value.find_index(1)
      index2 = hand2_value.find_index(1)

      if index1 > index2
        result = 1
      elsif index1 < index2
        result = -1
      else
        hand1_card_index = get_hand_index_array(hand1)
        hand2_card_index = get_hand_index_array(hand2)

        flag = 0
        if index1 == 1 || index1 == 2 || index1 == 3 || index1 == 7
          hand1_pair, hand1_pairs_unique = get_pair_arrays(hand1)
          hand2_pair, hand2_pairs_unique = get_pair_arrays(hand2)
          flag = 1
        end

        if flag == 1
          if hand1_pairs_unique[0] > hand2_pairs_unique[0]
            result = 1
          elsif hand1_pairs_unique[0] < hand2_pairs_unique[0]
            result = -1
          else
            result = check_same_hand(hand1_card_index, hand2_card_index)
          end
        else
          result = check_same_hand(hand1_card_index, hand2_card_index)
        end
      end
    elsif is_hand1_high_card == 0 && is_hand2_high_card == 1
      result = 1
    elsif is_hand1_high_card == 1 && is_hand2_high_card == 0
      result = -1
    elsif is_hand1_high_card == 1 and is_hand2_high_card == 1
      result = check_high_hand(hand1, hand2)
    end

    return result
  end


end
