class Card

  def make_values
    value = []
    (2...11).each do |n|
      value.append(n.to_s)
    end
    value.append('J')
    value.append('Q')
    value.append('K')
    value.append('A')
    return value
  end
end
