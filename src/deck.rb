require_relative "card.rb"

class Deck

  #Initializes deck with all 81 cards.
  def initialize
    @colors   = ['Red', 'Green', 'Purple']
    @fills = ['Solid', 'Striped', 'Empty']
    @shapes  = ['Diamond', 'Squiggle', 'RoundedRectangle']
    @numbers  = [1, 2, 3]
    @deck = Array.new(81)
    i = 0
    @colors.each { |color|
      @fills.each { |fill|
        @shapes.each { |shape|
          @numbers.each { |number|
            @deck[i] = Card.new(color, fill, shape, number)
            i += 1
          }
        }
      }
    }
    @deck.shuffle!
  end

  #Returns string version of the deck
  def to_s
    for i in 0..81
      @deck[i].to_s
    end
  end

  #Removes a random card from the deck.
  def removeAny
    @deck.pop
  end

  def cardsRemaining
    @deck.length
  end
end
