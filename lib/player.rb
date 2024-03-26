class Player
  #status can be 0=>fold, 1=>check, 2=>call, 3=>raise
  attr_accessor :status

  def initialize(hand, pot)
    @hand = hand
    @pot = pot
  end

  def fold
    status = 0
    return status
  end
end
