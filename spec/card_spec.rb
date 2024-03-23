require 'card'


describe Card do
  describe "#values" do
    it "make values for every card suits" do
      card = Card.new
      result = ['2', '3', '4', '5', '6', '7', '8', '9','10', 'J', 'Q', 'K','A']
      expect(card.make_values).to eql(result)
    end
  end

  describe "#suits" do
    it "make spade suit" do
      card = Card.new
      values = ['2', '3', '4', '5', '6', '7', '8', '9','10', 'J', 'Q', 'K','A']
      result = {'suit': 'spade', 'values': values}
      expect(card.make_suits[0]).to eql(result)
    end
  end

  describe "#suits" do
    it "make hearts suit" do
      card = Card.new
      values = ['2', '3', '4', '5', '6', '7', '8', '9','10', 'J', 'Q', 'K','A']
      result = {'suit': 'hearts', 'values': values}
      expect(card.make_suits[1]).to eql(result)
    end
  end

  describe "#suits" do
    it "make club suit" do
      card = Card.new
      values = ['2', '3', '4', '5', '6', '7', '8', '9','10', 'J', 'Q', 'K','A']
      result = {'suit': 'club', 'values': values}
      expect(card.make_suits[2]).to eql(result)
    end
  end

  describe "#suits" do
    it "make diamond suit" do
      card = Card.new
      values = ['2', '3', '4', '5', '6', '7', '8', '9','10', 'J', 'Q', 'K','A']
      result = {'suit': 'diamond', 'values': values}
      expect(card.make_suits[3]).to eql(result)
    end
  end
end
