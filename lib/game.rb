class Game
  attr_accessor :deck
  attr_accessor :cards
  attr_accessor :players
  attr_accessor :game_pot

  def initialize(deck, new_players)
    @game_pot = 0
    @deck = deck
    @players = new_players
  end

  def start
    @card = @deck.shuffle_cards
    players_cards = @deck.deal_cards(@card)
    (0...3).each do |n|
      @players[n].hand.cards = players_cards[n][:hand]
    end
  end

  def check_high_hand(player1, player2)
    hand1_index = player1.hand.get_hand_card_index
    hand2_index = player2.hand.get_hand_card_index
    result = hand1_index <=> hand2_index
    return result
  end

  def check_same_hand(player1, player2)
    result = -2
    hand1_card_index = player1.hand.get_hand_card_index
    hand2_card_index = player2.hand.get_hand_card_index
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


  def compare_hands(player1, player2)
    #result can be 1, 0, -1. if 1, then hand1 wins. if 0, then it is a tie. if -1, then hand2 wins
    result = -2
    hand1 = player1.hand
    hand2 = player2.hand

    hand1_value = player1.hand.get_hand_pattern
    hand2_value = player2.hand.get_hand_pattern

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
        hand1_card_index = player1.hand.get_hand_card_index
        hand2_card_index = player2.hand.get_hand_card_index

        flag = 0
        if index1 == 1 || index1 == 2 || index1 == 3 || index1 == 7
          hand1_pair, hand1_pairs_unique = player1.hand.get_card_pairs
          hand2_pair, hand2_pairs_unique = player2.hand.get_card_pairs
          flag = 1
        end

        if flag == 1
          if hand1_pairs_unique[0] > hand2_pairs_unique[0]
            result = 1
          elsif hand1_pairs_unique[0] < hand2_pairs_unique[0]
            result = -1
          else
            result = check_same_hand(player1, player2)
          end
        else
          result = check_same_hand(player1, player2)
        end
      end
    elsif is_hand1_high_card == 0 && is_hand2_high_card == 1
      result = 1
    elsif is_hand1_high_card == 1 && is_hand2_high_card == 0
      result = -1
    elsif is_hand1_high_card == 1 and is_hand2_high_card == 1
      result = check_high_hand(player1, player2)
    end

    return result
  end



end
