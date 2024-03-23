require 'card'


describe Card do
  describe "#values" do
    it "make values for every card suits" do
      card = Card.new
      result = ['2', '3', '4', '5', '6', '7', '8', '9','10', 'J', 'Q', 'K','A']
      expect(card.make_values).to eql(result)
    end
  end
end
