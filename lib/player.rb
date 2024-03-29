class Player
  #status can be 0=>fold, 1=>check, 2=>call, 3=>raise
  attr_accessor :status
  # attr_accessor :pot
  attr_accessor :hand

  def initialize(hand, pot)
    @hand = hand
    @pot = pot
    @status = -1
  end

  def set_pot(pot)
    @pot = pot
  end

  def get_pot
    @pot
  end

  def deduct_pot(amount)
    if amount > @pot
      -1
    else
      @pot = @pot - amount
      amount
    end
  end

  def pot_fold
    @status = 0
  end

  def pot_check
    @status = 1
  end

  def pot_call(amount)
    call_amount = deduct_pot(amount)
    if call_amount == amount
      @status = 2
    end
    call_amount
  end

  def pot_raise(amount)
    call_amount = deduct_pot(amount)
    if call_amount == amount
      @status = 3
    end
    call_amount
  end

  def card_replace(cards, top_index, card_replaced_index)
    no_of_cards = card_replaced_index.length
    @hand.get_cards.delete_if.with_index{|_, i| card_replaced_index.include?(i) }
    (0...no_of_cards).each do |n|
      @hand.get_cards.append(cards[top_index])
      top_index = top_index + 1
    end
    top_index
  end
end
