class Hand
  # attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def set_cards(cards)
    @cards = cards
  end

  def get_cards
    @cards
  end

  def get_hand_card_index
    values = ['2', '3', '4', '5', '6', '7', '8', '9','10', 'J', 'Q', 'K','A']
    card_index = []

    @cards.each do |c|
      index = values.find_index(c[:value])
      card_index.append(index)
    end
    card_index.sort!{|a,b| b<=>a}
    return card_index
  end

  def get_card_pairs
    card_index_array = get_hand_card_index
    card_pairs = card_index_array.find_all{ |e| card_index_array.count(e) > 1 }
    card_pairs_unique = card_pairs.group_by(&:itself).select{|_, a| a[1]}.keys

    return card_pairs, card_pairs_unique
  end

  def check_single_pair
    card_pairs, card_pairs_unique = get_card_pairs
    element_count = card_pairs.length()
    unique_element_count = card_pairs_unique.length()

    if unique_element_count == 1 && element_count == 2
      result = 1
    else
      result = 0
    end
    return result
  end

  def check_double_pair
    card_pairs, card_pairs_unique = get_card_pairs
    element_count = card_pairs.length()
    unique_element_count = card_pairs_unique.length()

    if unique_element_count == 2 && element_count == 4
      result = 1
    else
      result = 0
    end
    return result
  end

  def check_three_of_a_kind
    card_pairs, card_pairs_unique = get_card_pairs
    element_count = card_pairs.length()
    unique_element_count = card_pairs_unique.length()

    if unique_element_count == 1 && element_count == 3
      result = 1
    else
      result = 0
    end
    return result
  end

  def check_four_of_a_kind
    card_pairs, card_pairs_unique = get_card_pairs
    element_count = card_pairs.length()
    unique_element_count = card_pairs_unique.length()

    if unique_element_count == 1 && element_count == 4
      result = 1
    else
      result = 0
    end
    return result
  end

  def check_pre_straight
    card_index_array = get_hand_card_index
    card_suits = @cards.map { |p| p[:suit] }.uniq
    straight_value = 1

    (0...4).each do |n|
      first_index = card_index_array[n]
      second_index = card_index_array[n+1]
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
    return straight_value, card_suits, card_index_array
  end

  def check_straight
    straight = 0
    straight_value, card_suits, card_index_array = check_pre_straight

    if straight_value == 1 && card_suits.length() > 1
      straight = 1
    end

    return straight
  end

  def check_straight_flush
    straight_first_condition = 0
    straight_second_condition = 1
    straight = 0
    straight_value, card_suits, card_index_array = check_pre_straight

    if straight_value == 1 && card_suits.length() == 1
      straight_first_condition = 1
    end

    if card_index_array[0] == 12 && card_index_array[1] == 11
      straight_second_condition = 0
    end

    if straight_first_condition == 1 && straight_second_condition == 1
      straight = 1
    end

    return straight
  end

  def check_royal_flush
    straight_first_condition = 0
    straight_second_condition = 0
    royal_flush = 0
    straight_value, card_suits, card_index_array = check_pre_straight

    if straight_value == 1 && card_suits.length() == 1
      straight_first_condition = 1
    end

    if card_index_array[0] == 12 && card_index_array[1] == 11
      straight_second_condition = 1
    end

    if straight_first_condition == 1 && straight_second_condition == 1
      royal_flush = 1
    end

    return royal_flush
  end

  def check_flush
    flush = 0
    is_straight_flush = check_straight_flush
    if is_straight_flush == 1
      return flush
    end

    is_royal_flush = check_royal_flush
    if is_royal_flush == 1
      return flush
    end

    card_suits = @cards.map { |p| p[:suit] }.uniq

    if card_suits.length() == 1
      flush = 1
    end

    return flush
  end

  def check_full_house
    card_pairs, card_pairs_unique = get_card_pairs
    full_house = 0

    if card_pairs_unique.length() != 2
      return full_house
    end

    hand_card_occurance = card_pairs.group_by{|e| e}.map{|k, v| [k, v.length]}.to_h
    hand_card_occurance = hand_card_occurance.sort_by {|_key, value| value}.to_h

    card_occurance =  hand_card_occurance.values
    if card_occurance[0] == 2 && card_occurance[1] == 3
      full_house = 1
    end

    return full_house
  end

  def get_hand_pattern
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
    hand_royal_flush = check_royal_flush

    # check if hand got royal flush
    if hand_royal_flush == 1
      continue_hand = 0
      hand_value[9] = 1
    end

    # check if hand checking continues or not, straight flush
    if continue_hand == 1
      hand_straight_flush = check_straight_flush
    end

    if hand_straight_flush == 1
      continue_hand = 0
      hand_value[8] = 1
    end

    # check if hand checking continues or not, four of a kinds.
    if continue_hand == 1
      hand_four_of_a_kind = check_four_of_a_kind
    end

    if hand_four_of_a_kind == 1
      continue_hand = 0
      hand_value[7] = 1
    end

    # check if hand checking continues or not, full house.
    if continue_hand == 1
      hand_full_house = check_full_house
    end

    if hand_full_house == 1
      continue_hand = 0
      hand_value[6] = 1
    end

    # check if hand checking continues or not, flush.
    if continue_hand == 1
      hand_flush = check_flush
    end

    if hand_flush == 1
      continue_hand = 0
      hand_value[5] = 1
    end

    # check if hand checking continues or not, straight.
    if continue_hand == 1
      hand_straight = check_straight
    end

    if hand_straight == 1
      continue_hand = 0
      hand_value[4] = 1
    end

    # check if hand checking continues or not, three of a kinds.
    if continue_hand == 1
      hand_three_of_a_kind = check_three_of_a_kind
    end

    if hand_three_of_a_kind == 1
      continue_hand = 0
      hand_value[3] = 1
    end

     # check if hand checking continues or not, double pairs.
    if continue_hand == 1
      hand_double_pair = check_double_pair
    end

    if hand_double_pair == 1
      continue_hand = 0
      hand_value[2] = 1
    end

    # check if hand checking continues or not, single pair.
    if continue_hand == 1
      hand_single_pair = check_single_pair
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

end
