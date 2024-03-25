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

  def compare_hands(hand1, hand2)
    #result can be 1, 0, -1. if 1, then hand1 wins. if 0, then it is a tie. if -1, then hand2 wins
    result = -2
    continue_hand1 = 1
    continue_hand2 = 1
    hand1_value = [0, 0, 0, 0 , 0, 0 , 0, 0, 0]
    hand2_value = [0, 0, 0, 0 , 0, 0 , 0, 0, 0]

    hand1_straight_flush = 0
    hand2_straight_flush = 0

    hand1_four_of_a_kind = 0
    hand2_four_of_a_kind = 0

    hand1_full_house = 0
    hand2_full_house = 0

    hand1_flush = 0
    hand2_flush = 0

    hand1_straight = 0
    hand2_straight = 0

    hand1_three_of_a_kind = 0
    hand2_three_of_a_kind = 0

    hand1_double_pair = 0
    hand2_double_pair = 0

    hand1_single_pair = 0
    hand2_single_pair = 0

    hand1_royal_flush = check_royal_flush(hand1)
    hand2_royal_flush = check_royal_flush(hand2)

    if hand1_royal_flush == 1
      continue_hand1 = 0
      hand1_value[8] = 1
    end

    if hand2_royal_flush == 1
      continue_hand2 = 0
      hand2_value[8] = 1
    end

    # check if hand checking continues or not, straight flush

    if continue_hand1 == 1
      hand1_straight_flush = check_straight_flush(hand1)
    end

    if continue_hand2 == 1
      hand2_straight_flush = check_straight_flush(hand2)
    end

    if hand1_straight_flush == 1
      continue_hand1 = 0
      hand1_value[7] = 1
    end

    if hand2_straight_flush == 1
      continue_hand2 = 0
      hand2_value[7] = 1
    end

    # check if hand checking continues or not, four of a kinds.

    if continue_hand1 == 1
      hand1_four_of_a_kind = check_four_of_a_kind(hand1)
    end

    if continue_hand2 == 1
      hand2_four_of_a_kind = check_four_of_a_kind(hand2)
    end

    if hand1_four_of_a_kind == 1
      continue_hand1 = 0
      hand1_value[6] = 1
    end

    if hand2_four_of_a_kind == 1
      continue_hand2 = 0
      hand2_value[6] = 1
    end

    # check if hand checking continues or not, full house.

    if continue_hand1 == 1
      hand1_full_house = check_full_house(hand1)
    end

    if continue_hand2 == 1
      hand2_full_house = check_full_house(hand2)
    end

    if hand1_full_house == 1
      continue_hand1 = 0
      hand1_value[5] = 1
    end

    if hand2_full_house == 1
      continue_hand2 = 0
      hand2_value[5] = 1
    end

    # check if hand checking continues or not, flush.

    if continue_hand1 == 1
      hand1_flush = check_flush(hand1)
    end

    if continue_hand2 == 1
      hand2_flush = check_flush(hand2)
    end

    if hand1_flush == 1
      continue_hand1 = 0
      hand1_value[4] = 1
    end

    if hand2_flush == 1
      continue_hand2 = 0
      hand2_value[4] = 1
    end

    # check if hand checking continues or not, straight.

    if continue_hand1 == 1
      hand1_straight = check_straight(hand1)
    end

    if continue_hand2 == 1
      hand2_straight = check_straight(hand2)
    end

    if hand1_straight == 1
      continue_hand1 = 0
      hand1_value[3] = 1
    end

    if hand2_straight == 1
      continue_hand2 = 0
      hand2_value[3] = 1
    end

    # check if hand checking continues or not, three of a kinds.

    if continue_hand1 == 1
      hand1_three_of_a_kind = check_three_of_a_kind(hand1)
    end

    if continue_hand2 == 1
      hand2_three_of_a_kind = check_three_of_a_kind(hand2)
    end

    if hand1_three_of_a_kind == 1
      continue_hand1 = 0
      hand1_value[2] = 1
    end

    if  hand2_three_of_a_kind == 1
      continue_hand2 = 0
      hand2_value[2] = 1
    end

     # check if hand checking continues or not, double pairs.

    if continue_hand1 == 1
      hand1_double_pair = check_double_pairs(hand1)
    end

    if continue_hand2 == 1
      hand2_double_pair = check_double_pairs(hand2)
    end

    if hand1_double_pair == 1
      continue_hand1 = 0
      hand1_value[1] = 1
    end

    if hand2_double_pair == 1
      continue_hand2 = 0
      hand2_value[1] = 1
    end

    # check if hand checking continues or not, single pair.

    if continue_hand1 == 1
      hand1_single_pair = check_single_pair(hand1)
    end

    if continue_hand2 == 1
      hand2_single_pair = check_single_pair(hand2)
    end

    if hand1_single_pair == 1
      continue_hand1 = 0
      hand1_value[0] = 1
    end

    if  hand2_single_pair == 1
      continue_hand2 = 0
      hand2_value[0] = 1
    end

    # if hand1 and hand2 contunues, then we need to check high cards

    if continue_hand1 == 0 && continue_hand2 == 0
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
        if index1 == 0 || index1 == 1 || index1 == 2 || index1 == 6
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
    elsif continue_hand1 == 0 && continue_hand2 == 1
      result = 1
    elsif continue_hand1 == 1 && continue_hand2 == 0
      result = -1
    elsif continue_hand1 == 1 and continue_hand2 == 1
      result = check_high_hand(hand1, hand2)
    end

    return result
  end

end
