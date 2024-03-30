class Game
  attr_accessor :deck
  attr_accessor :cards
  attr_accessor :player1
  attr_accessor :player2
  attr_accessor :player3
  attr_accessor :player4
  attr_accessor :game_pot
  attr_accessor :top_index
  attr_accessor :total_winners

  def initialize(deck, new_players)
    @game_pot = 0
    @total_winners = 0
    @top_index = 20
    @deck = deck

    (0...4).each do |n|
      instance_variable_set("@player#{n+1}", new_players[n])
    end

    # suits1 = ["spade", "hearts", "club", "diamond"]
    # values1 = ['A', 'J', '9', '10', 'K']
    # @cards1 = []
    # @cards1.append({'suit':suits1[0], 'value': values1[0]})
    # @cards1.append({'suit':suits1[1], 'value': values1[1]})
    # @cards1.append({'suit':suits1[2], 'value': values1[2]})
    # @cards1.append({'suit':suits1[3], 'value': values1[3]})
    # @cards1.append({'suit':suits1[0], 'value': values1[4]})
    #
    # @player1 = Player.new(@cards1, 100)
    # @player2 = Player.new(@cards1, 100)
    # @player3 = Player.new(@cards1, 100)
    # @player4 = Player.new(@cards1, 100)
  end

  def start
    @cards = @deck.shuffle_cards
    players_cards = @deck.deal_cards(@cards)

    @player1.hand.set_cards(players_cards[0][:hand])
    @player2.hand.set_cards(players_cards[1][:hand])
    @player3.hand.set_cards(players_cards[2][:hand])
    @player4.hand.set_cards(players_cards[3][:hand])

    init_bet = 10
    @player1.set_pot(@player1.get_pot - init_bet)
    @game_pot = @game_pot + init_bet

    init_bet = 20
    @player2.set_pot(@player2.get_pot - init_bet)
    @game_pot = @game_pot + init_bet

    init_bet = 10
    @player3.set_pot(@player3.get_pot - init_bet)
    @game_pot = @game_pot + init_bet

    init_bet = 20
    @player4.set_pot(@player4.get_pot - init_bet)
    @game_pot = @game_pot + init_bet

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
        # hand1_card_index = player1.hand.get_hand_card_index
        # hand2_card_index = player2.hand.get_hand_card_index

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

  def discard_card(player, top_index)
    # top_index = 20
    values = ['2', '3', '4', '5', '6', '7', '8', '9','10', 'J', 'Q', 'K','A']

    hand_value = player.hand.get_hand_pattern
    pattern_index = hand_value.find_index(1)

    if pattern_index == 0
      card_index = []
      player.hand.get_cards.each do |c|
        index = values.find_index(c[:value])
        card_index.append(index)
      end
      hand_card_replace = card_index.min(3)
      hand_card_index = []
      hand_card_replace.each do |item|
        hand_card_index.append(card_index.find_index(item))
      end
      player.card_replace(@cards, top_index, hand_card_index)
      top_index = top_index + 3
    elsif pattern_index == 1
      card_index = []
      player.hand.get_cards.each do |c|
        index = values.find_index(c[:value])
        card_index.append(index)
      end
      hand_card_replace = card_index.find_all { |x| card_index.count(x) == 1 }
      hand_card_index = []
      hand_card_replace.each do |item|
        hand_card_index.append(card_index.find_index(item))
      end
      player.card_replace(@cards, top_index, hand_card_index)
      top_index = top_index + 3
    elsif pattern_index == 2
      card_index = []
      player.hand.get_cards.each do |c|
        index = values.find_index(c[:value])
        card_index.append(index)
      end
      hand_card_replace = card_index.find_all { |x| card_index.count(x) == 1 }
      hand_card_index = []
      hand_card_replace.each do |item|
        hand_card_index.append(card_index.find_index(item))
      end
      player.card_replace(@cards, top_index, hand_card_index)
      top_index = top_index + 1
    elsif pattern_index == 3
      card_index = []
      player.hand.get_cards.each do |c|
        index = values.find_index(c[:value])
        card_index.append(index)
      end
      hand_card_replace = card_index.find_all { |x| card_index.count(x) == 1 }
      hand_card_index = []
      hand_card_replace.each do |item|
        hand_card_index.append(card_index.find_index(item))
      end
      player.card_replace(@cards, top_index, hand_card_index)
      top_index = top_index + 2
    end

    return player, top_index
  end

  def card_discard_round
    @top_index = 20
    @player1, @top_index = discard_card(@player1, top_index)
    @player2, @top_index = discard_card(@player2, top_index)
    @player3, @top_index = discard_card(@player3, top_index)
    @player4, @top_index = discard_card(@player4, top_index)
  end

  def check_should_bet(player, bet)
    should = 0
    amount = 0
    if bet >= player.get_pot
      if player.get_pot == 0
        amount = 0
        should = 0
      else
        amount = player.get_pot
        should = 1
      end
    elsif bet == 0
      should = 0
      amount = 0
    else
      should = 1
      amount = bet
    end

    return should, amount
  end

  def betting_round
    player_hands = []
    player_should_bet = []
    players_bet_amount = [0, 0, 0, 0]

    # (0...4).each do |n|
    #   hand_value = @players[n].hand.get_hand_pattern
    #   player_hands.append(hand_value.find_index(1))
    # end

    hand1_value = @player1.hand.get_hand_pattern
    player_hands.append(@player1.hand.get_hand_pattern.find_index(1))

    hand2_value = @player2.hand.get_hand_pattern
    player_hands.append(@player2.hand.get_hand_pattern.find_index(1))

    hand3_value = @player3.hand.get_hand_pattern
    player_hands.append(@player3.hand.get_hand_pattern.find_index(1))

    hand4_value = @player4.hand.get_hand_pattern
    player_hands.append(@player4.hand.get_hand_pattern.find_index(1))

    #prev_player_decision can be 0=>fold, 1=>check, 2=>call, 3=>raise
    first_time = 1
    pot_difference = 0
    last_active_player = @player1
    last_active_player_bet = 0

    loop do
      # (0...4).each do |n|
      #   bet = player_hands[n] * 10
      #   should_bet, amount = check_should_bet(players[0], bet)
      #   player_should_bet.append({"should_bet": should_bet, "amount": amount})
      # end

      bet = player_hands[0] * 10
      should_bet, amount = check_should_bet(@player1, bet)
      player_should_bet.append({"should_bet": should_bet, "amount": amount})

      bet = player_hands[1] * 10
      should_bet, amount = check_should_bet(@player2, bet)
      player_should_bet.append({"should_bet": should_bet, "amount": amount})

      bet = player_hands[2] * 10
      should_bet, amount = check_should_bet(@player3, bet)
      player_should_bet.append({"should_bet": should_bet, "amount": amount})

      bet = player_hands[3] * 10
      should_bet, amount = check_should_bet(@player4, bet)
      player_should_bet.append({"should_bet": should_bet, "amount": amount})

      if @player1.status != 0
        if first_time == 1
          #first player
          if player_should_bet[0][:should_bet] == 1
            player1_bet_amount = player_should_bet[0][:amount]
            @player1.pot_raise(player1_bet_amount)
            @game_pot = @game_pot + player1_bet_amount
            pot_difference = pot_difference + player1_bet_amount
            last_active_player_bet = player1_bet_amount
            players_bet_amount[0] = player1_bet_amount
          else
            @player1.pot_check
          end
        else
          #not first time
          if player_should_bet[0][:should_bet] == 0
            if last_active_player.status == 1
              @player1.pot_check
            else
              @player1.pot_fold
            end
          else
            player1_bet_amount = player_should_bet[0][:amount]
            # need to implement : if player2 will bet or check
            if last_active_player.status == 1
              @player1.pot_raise(player1_bet_amount)
              @game_pot = @game_pot + player1_bet_amount
              pot_difference = pot_difference + player1_bet_amount - last_active_player_bet
              last_active_player_bet = player1_bet_amount
              players_bet_amount[0] = player1_bet_amount
            else
              if last_active_player_bet == player1_bet_amount
                @player1.pot_call(player1_bet_amount)
                @game_pot = @game_pot + player1_bet_amount
                # pot_difference = pot_difference + player2_bet_amount - last_active_player_bet
                last_active_player_bet = player1_bet_amount
                players_bet_amount[0] = player1_bet_amount
              elsif last_active_player_bet < player1_bet_amount
                @player1.pot_raise(player1_bet_amount)
                @game_pot = @game_pot + player1_bet_amount
                pot_difference = pot_difference + player1_bet_amount - last_active_player_bet
                last_active_player_bet = player1_bet_amount
                players_bet_amount[0] = player1_bet_amount
              else
                @player1.pot_fold
                players_bet_amount[0] = 0
              end
            end
          end

        end
      end

      if @player1.status != 0
        last_active_player = @player1
      end

      if @player2.status != 0
        #second player
        if player_should_bet[1][:should_bet] == 0
          if last_active_player.status == 1
            @player2.pot_check
          else
            @player2.pot_fold
          end
        else
          player2_bet_amount = player_should_bet[1][:amount]
          # need to implement : if player2 will bet or check
          if last_active_player.status == 1
            @player2.pot_raise(player2_bet_amount)
            @game_pot = @game_pot + player2_bet_amount
            pot_difference = pot_difference + player2_bet_amount - last_active_player_bet
            last_active_player_bet = player2_bet_amount
            players_bet_amount[1] = player2_bet_amount
          else
            if last_active_player_bet == player2_bet_amount
              @player2.pot_call(player2_bet_amount)
              @game_pot = @game_pot + player2_bet_amount
              # pot_difference = pot_difference + player2_bet_amount - last_active_player_bet
              last_active_player_bet = player2_bet_amount
              players_bet_amount[1] = player2_bet_amount
            elsif last_active_player_bet < player2_bet_amount
              @player2.pot_raise(player2_bet_amount)
              @game_pot = @game_pot + player2_bet_amount
              pot_difference = pot_difference + player2_bet_amount - last_active_player_bet
              last_active_player_bet = player2_bet_amount
              players_bet_amount[1] = player2_bet_amount
            else
              @player2.pot_fold
              players_bet_amount[1] = 0
            end
          end
        end
      end

      if @player2.status != 0
        last_active_player = @player2
      end

      if @player3.status != 0
        #third player
        # check if the player can bet
        if player_should_bet[2][:should_bet] == 0
          if last_active_player.status == 1
            @player3.pot_check
          else
            @player3.pot_fold
          end
        else
          player3_bet_amount = player_should_bet[2][:amount]
          # need to implement : if player2 will bet or check
          if last_active_player.status == 1
            @player3.pot_raise(player3_bet_amount)
            @game_pot = @game_pot + player3_bet_amount
            pot_difference = pot_difference + player3_bet_amount - last_active_player_bet
            last_active_player_bet = player3_bet_amount
            players_bet_amount[2] = player3_bet_amount
          else
            if last_active_player_bet == player3_bet_amount
              @player3.pot_call(player3_bet_amount)
              @game_pot = @game_pot + player3_bet_amount
              # pot_difference = pot_difference + player2_bet_amount - last_active_player_bet
              last_active_player_bet = player3_bet_amount
              players_bet_amount[2] = player3_bet_amount
            elsif last_active_player_bet < player3_bet_amount
              @player3.pot_raise(player3_bet_amount)
              @game_pot = @game_pot + player3_bet_amount
              pot_difference = pot_difference + player3_bet_amount - last_active_player_bet
              last_active_player_bet = player3_bet_amount
              players_bet_amount[2] = player3_bet_amount
            else
              @player3.pot_fold
              players_bet_amount[2] = 0
            end
          end
        end
      end

      if @player3.status != 0
        last_active_player = @player3
      end

      if @player4.status != 0
        #third player
        # check if the player can bet
        if player_should_bet[3][:should_bet] == 0
          if last_active_player.status == 1
            @player4.pot_check
          else
            @player4.pot_fold
          end
        else
          player4_bet_amount = player_should_bet[3][:amount]
          # need to implement : if player2 will bet or check
          if last_active_player.status == 1
            @player4.pot_raise(player4_bet_amount)
            @game_pot = @game_pot + player4_bet_amount
            pot_difference = pot_difference + player4_bet_amount - last_active_player_bet
            last_active_player_bet = player4_bet_amount
            players_bet_amount[3] = player4_bet_amount
          else
            if last_active_player_bet == player4_bet_amount
              @player4.pot_call(player4_bet_amount)
              @game_pot = @game_pot + player4_bet_amount
              # pot_difference = pot_difference + player2_bet_amount - last_active_player_bet
              last_active_player_bet = player4_bet_amount
              players_bet_amount[3] = player4_bet_amount
            elsif last_active_player_bet < player4_bet_amount
              @player4.pot_raise(player4_bet_amount)
              @game_pot = @game_pot + player4_bet_amount
              pot_difference = pot_difference + player4_bet_amount - last_active_player_bet
              last_active_player_bet = player4_bet_amount
              players_bet_amount[3] = player4_bet_amount
            else
              @player4.pot_fold
              players_bet_amount[3] = 0
            end
          end
        end
      end

      if @player4.status != 0
        last_active_player = @player4
      end

      flag = 1
      if @player1.status != 0
        if players_bet_amount[0] < pot_difference
          flag = 0
        end
      end

      if @player2.status != 0
        if players_bet_amount[1] < pot_difference
          flag = 0
        end
      end

      if @player3.status != 0
        if players_bet_amount[2] < pot_difference
          flag = 0
        end
      end

      if @player4.status != 0
        if players_bet_amount[3] < pot_difference
          flag = 0
        end
      end

      if flag == 1
        break
      end
      first_time = 0
    end
  end

  def start_five_hand_poker
    start
    betting_round
    card_discard_round
    betting_round
    winner_players = []

    winner = 0
    draw = 0

    first_compare = compare_hands(@player1, @player2)

    if first_compare == 1
      second_compare = compare_hands(@player1, @player3)
      if second_compare == 1
        final_compare = compare_hands(@player1, @player4)
        if final_compare == 1
          winner_players.append(1)
        elsif final_compare == -1
          winner_players.append(4)
        else
          winner_players.append(1)
          winner_players.append(4)

        end
      elsif second_compare == -1
        final_compare = compare_hands(@player3, @player4)
        if final_compare == 1
          winner_players.append(3)
        elsif final_compare == -1
          winner_players.append(4)
        else
          winner_players.append(3)
          winner_players.append(4)
        end
      end
    elsif first_compare == -1
      second_compare = compare_hands(@player2, @player3)
      if second_compare == 1
        final_compare = compare_hands(@player2, @player4)
        if final_compare == 1
          winner_players.append(2)
        elsif final_compare == -1
          winner_players.append(4)
        else
          winner_players.append(2)
          winner_players.append(4)
        end
      elsif second_compare == -1
        final_compare = compare_hands(@player3, @player4)
        if final_compare == 1
          winner_players.append(3)
        elsif final_compare == -1
          winner_players.append(4)
        else
          winner_players.append(3)
          winner_players.append(4)
        end
      end
    else
      second_compare = compare_hands(@player2, @player3)
      if second_compare == 1
        final_compare = compare_hands(@player2, @player4)
        if final_compare == 1
          winner_players.append(1)
          winner_players.append(2)
        elsif final_compare == -1
          winner_players.append(4)
        else
          winner_players.append(2)
          winner_players.append(1)
          winner_players.append(4)
        end
      elsif second_compare == -1
        final_compare = compare_hands(@player3, @player4)
        if final_compare == 1
          winner_players.append(3)
        elsif final_compare == -1
          winner_players.append(4)
        else
          winner_players.append(3)
          winner_players.append(4)
        end
      else
        final_compare = compare_hands(@player3, @player4)
        if final_compare == 1
          winner_players.append(1)
          winner_players.append(2)
          winner_players.append(3)
        elsif final_compare == -1
          winner_players.append(1)
          winner_players.append(2)
          winner_players.append(4)
        else
          winner_players.append(1)
          winner_players.append(2)
          winner_players.append(3)
          winner_players.append(4)
      end
    end
    end

    n = winner_players.length
    if n == 1
      puts "Winner player #{winner_players[0]}"
    elsif n == 2
      puts "Winner player #{winner_players[0]} and #{winner_players[1]}"
    elsif n == 3
      puts "Winner player #{winner_players[0]} and #{winner_players[1]} and #{winner_players[2]}"
    else
      puts "Winner player #{winner_players[0]} and #{winner_players[1]} and #{winner_players[2]} and #{winner_players[3]}"
    end
    @total_winners = n
  end
end
